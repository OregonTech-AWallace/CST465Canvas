# Working with Databases

## System.Data namespace
The System.Data namespace contains the interfaces and utility classes used as the foundation for actual implementations of database connectivity.

**IDbConnection** – Handles the actual connection to the database

**IDbCommand** – The command to execute against the database

**IDataReader** – Reads data from the database one row at a time

Some examples database engines that have libraries inheriting from System.Data are:

- **SQL Server** - Uses `Microsoft.Data.SqlClient` namespace (classes like SqlConnection, SqlCommand, SqlDataReader)
- **Oracle** - Uses `Oracle.ManagedDataAccess.Client` namespace (Oracle's managed provider) 
- **OLE DB** - Uses `System.Data.OleDb` namespace for various databases like Access, Excel, older SQL Server versions
- **ODBC** - Uses `System.Data.Odbc` namespace for databases with ODBC drivers
- **SQLite** - Third-party providers like `System.Data.SQLite`
- **MySQL** - Uses `MySql.Data.MySqlClient` namespace
- **PostgreSQL** - Uses `Npgsql` provider
- **Entity Framework** - Uses `System.Data.Entity` for ORM functionality across multiple database engines

The packages for working with these databases are available via NuGet and all these providers implement the common interfaces defined in System.Data, such as `IDbConnection`, `IDbCommand`, and `IDataReader`.

## Microsoft.Data.SqlClient
This package supercedes the System.Data.SqlClient package that was used up until recently.  It contains implementations of the interfaces defined in System.Data, which are similarly named SqlConnection, SqlCommand and SqlDataReader.


## Making a Connection
### Defining the Connection String
A connection string is a specially formatted string of text which tells the a database library how to make a connection to the desired database, including fields such as the server, the database on the server, username, password, and other connection attributes.

`User Secrets File`
```json
{
    "ConnectionStrings": {
        "SomeDB": "server=cst465.database.windows.net;Database=alan.wallace;User Id=alan.wallace;Password=This is not a real password, so don't even try;"
    }
}
```
`Any File Where You Will Make a Connection...`
```csharp
SqlConnection connection = new SqlConnection(_Config["ConnectionStrings:SomeDB"]);
try
{
    connection.Open();
    //Perform your database operations
}
catch(Exception ex)
{
    //Handle an exception if thrown
}
finally
{
    connection.Close();
}
```
**STOP!**

Before you use the above code, I should mention that `SqlConnection`, `SqlCommand`, and `SqlDataReader` all implement the `IDisposable` interface.  

Instead, let's write this:
```csharp
using(SqlConnection connection = new SqlConnection(_Config.GetConnectionString("SomeDB"));
try
{
    connection.Open();
    //Perform your database operations
}
catch(Exception ex)
{
    //Handle any errors from the database operations
}

```

NOTE: `connection.Close()` will automatically get called when the object's `Dispose()` method is called.  

The `using` block only adds peace of mind that the object will get cleaned up, but there is still the possibility that exceptions may be thrown that we would want to handle, such as being unablle to open a connection to the database.  This is why we still use a `try`/`catch` block.

## Creating a Command
### Command with SQL query text
```csharp
using SqlCommand command = new SqlCommand();
command.Connection = connection;
command.CommandType = CommandType.Text;
command.CommandText = "SELECT * FROM Students ORDER BY LastName";
```

### Command for a Stored Procedure
```csharp
using SqlCommand command = new SqlCommand();
command.Connection = connection;
command.CommandType = CommandType.StoredProcedure;
command.CommandText="MyProcedureName";
```

## Executing a Command
### Getting a Single Value
The `ExecuteScalar()` method of the command object is used to return a single value from the database.  If multiple rows/columns would be returned, it retrieves the **first column** of the **first row** of the dataset.
```csharp
using(SqlConnection connection = new SqlConnection(_Config.GetConnectionString("SomeDB"));
using SqlCommand command = new SqlCommand();
command.Connection = connection;
command.CommandType = CommandType.Text;
command.CommandText = "SELECT * FROM Students ORDER BY LastName";

try
{
    connection.Open();
    object sqlValue = command.ExecuteScalar();
    int studentID = (int)sqlValue;
}
catch(Exception ex)
{
    //Handle error
}
```
The result of `command.ExecuteScalar()` is an object because it won't know specifically what kind of value the query returns until it happens.  The object does have a more specific type when returned from the database, so we can cast the result.

### Executing a Command with No Result
Sometimes we want to run a command against the database, but don't expect a result back.  This is common for UPDATE, DELETE, and sometimes INSERT commands.  I say sometimes for INSERT because it is also a common practice for an INSERT to return the ID of the new record which would utilize the `ExecuteScalar()` method

```csharp
using(SqlConnection connection = new SqlConnection(_Config.GetConnectionString("SomeDB"));
using SqlCommand command = new SqlCommand();
command.Connection = connection;
command.CommandType = CommandType.Text;
command.CommandText = "DELETE FROM Students";

try
{
    connection.Open();
    command.ExecuteNonQuery();
}
catch(Exception ex)
{
    //Handle error
}
```

### Result Set With Multiple Rows/Columns
```csharp
using(SqlConnection connection = new SqlConnection(_Config.GetConnectionString("SomeDB"));
using SqlCommand command = new SqlCommand();
command.Connection = connection;
command.CommandType = CommandType.Text;
command.CommandText = "SELECT ID, FirstName, LastName, DateAdmitted FROM Students ORDER BY LastName";

connection.Open();
using SqlDataReader reader = command.ExecuteReader();

//Each call to reader.Read() will attempt to get a single record from the result set.  It returns true if there is a row to read, false otherwise
while(reader.Read()) 
{
    //AI may suggest something like this:
    int ID = reader.GetInt32(0);
    //This will get the column by it's position, so position 0 would be the first item in the select list.  This is NOT readable.
    
    //A better option is this:
    int ID = (int)reader["ID"];
    //This is much more readable, but requires explicit casting and has more overhead due to the use of an indexer

    //A third option is this:
    int ID = reader.GetInt32(reader.GetOrdinal("ID"));
    //This is the best so far, but still kind of awful that we have to do two function calls on the reader
}
```

### An Even Better Approach
My preferred approach when dealing with readers is to use the third option, but spruce it up a little.  We'll write some extension methods to make this happen:
```csharp
using System.Data;
public static class DataReaderExtensions
{
    public static int GetInt32(this IDataReader reader, string columnName)
    {
        return reader.GetInt32(reader.GetOrdinal(columnName));
    }
    public static bool GetBoolean(this IDataReader reader, string columnName)
    {   
        return reader.GetBoolean(reader.GetOrdinal(columnName));
    }
    //There are a number of other methods that need to be overridden
}
```
Now we can read data like this:
```csharp
while(reader.Read()) 
{
    int ID = reader.GetInt32("ID");
}
```
This is the fastest, simplest, and cleanest solution in my opinion


### Passing Parameters
When working with the database, we will no doubt have to pass in our own data.  We're going to jump right into the **right way** to do it.  We'll save discussion about the wrong way for the section on SQL injection.
```csharp
int id = 15;

using(SqlConnection connection = new SqlConnection(_Config.GetConnectionString("SomeDB"));
using SqlCommand command = new SqlCommand();
command.Connection = connection;
command.CommandType = CommandType.Text;
command.CommandText = "DELETE FROM Students WHERE ID=@ID";
command.Parameters.AddWithValue("@ID", id);
try
{
    connection.Open();
    command.ExecuteNonQuery();
}
catch(Exception ex)
{
    //Handle error
}
```
Parameters are specified in the command text using the `@` symbol, such as `@ID` in the example.  To specify the value, we add a parameter to the command with the same name.  It doesn't matter what type the parameter is, it will typically automatically determine that and correctly output/escape it in the command.