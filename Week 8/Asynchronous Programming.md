# Asynchronous Programming
Up to this point, we have looked at purely synchronous programming within the .NET framework.  Now that we have a basic understanding of the underlying concepts, it's time to take things one step further.  

## Synchronous vs Asynchronous Web Programming
At this point, all of the code we have written in this class have been set up for synchronous execution.  This means that only one web request would be processed at a time, and if that request had any long-running database operations, every other request would have to wait.  Implementing asynchronous constructs will allow our application to continue serving requests even when some may have I/O operations pending.

## Making a Controller Asynchronous
`ArmadilloController.cs` (Synchronous)
```csharp
public IActionResult Index()
{
    return View();
}
```
`ArmadilloController.cs` (Asynchronous)
```csharp
public async Task<IActionResult> Index()
{
    return View();
}
```
Notice that, at this point, the only difference to make a function **asynchronous** was adding the `async` keyword and changing the return type to `Task<IActionResult>`.  The Task return type indicates that an operation can be put on hold and resumed later, although it does not need to do that yet.  Let's give it reason to.

`ArmadilloController.cs` (Asynchronous)
```csharp
public async Task<IActionResult> Index()
{
    await Task.Delay(2000); //This is essentailly a Sleep command
    return View();
}
```
The `Task.Delay(2000)` call also has a `Task` return type.  The `await` keyword indicates that this is a place where execution can be put on hold.  At this point, The `Task<IActionResult>` type is actually returned by your function, even though it has not executed to completion. The caller holds on to this reference and releases the thread so that it can be used to handle other requests.  Once the `await`ed method completes, the rest of this function will then continue execution.

### But how does the awaited operation continue execution if the thread is released?
At some point down the `await` stack, most operations, such as database queries, actually turn control over to OS-level operations.  When those operations complete, the queue an event back into the .NET runtime notifying it.

## When Does Asynchronous Programming Make Sense?
When getting started with async programming, it can be easy to go overboard and try to make EVERYTHING using async mechanisms.  Async programming comes with additional overhead, so it is important to know when it is appropriate to use it. Asynchronous programming makes sense any time that the application is dependent on resources that fall outside of its control, such as accessing files from the file system or dealing with network/database connections.

## Making Async Synchronous
It is possible to call asynchronous methods synchronously:
`ArmadilloController.cs` (Asynchronous)
```csharp
```csharp
public IActionResult Index()
{
    Task.Delay(2000).Wait(); // Blocks the thread until completion
    return View();
}
```

Or using `.Result`:

```csharp
public IActionResult Index()
{
    Task.Delay(2000).GetAwaiter().GetResult(); // Alternative synchronous approach
    return View();
}
```

**Warning:** Calling async methods synchronously can lead to deadlocks in certain situations and blocks threads.  There are **very few** times when this is a good idea


## Making a Repository Method Async
The following code takes a previous implementation of a **repository** method and makes it async-friendly:
```csharp
public async Task<IEnumerable<Armadillo>> GetList()
    {
        List<Armadillo> armadillos = new List<Armadillo>();
        using SqlConnection connection = new SqlConnection(_Config.GetConnectionString("SomeDB"));
        using SqlCommand command = new SqlCommand();
        command.Connection = connection;
        command.CommandType = CommandType.Text;
        command.CommandText = "SELECT Name, Rotundness FROM ArmadilloFarm ORDER BY Name";
        try
        {
            await connection.OpenAsync();
            using SqlDataReader reader = await command.ExecuteReaderAsync();

            //Each call to reader.Read() will attempt to get a single record from the result set.  It returns true if there is a row to read, false otherwise
            while(await reader.ReadAsync()) 
            {
                Armadillo armadillo = new Armadillo();
                //The following two lines assume that you have extension methods in place as we previously learned about
                armadillo.Name = reader.GetString("Name");
                armadillo.Rotundness = reader.GetInt32("Rotundness");

                //Add the armadillo to the list
                armadillos.Add(armadillo);
            }
        }
        catch(Exception ex)
        {
            //Handle exception
        }
        return armadillos;
    }
```
