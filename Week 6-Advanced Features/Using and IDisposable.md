# `using` Blocks and the `IDisposable` Interface
## What is the IDisposable Interface?
The `IDisposable` interface is implemented by classes that allocate resources that could potentially be left dangling if not explicitly handled. The `IDisposable` interface defines a method named `Dispose()`.  The purpose of the `Dispose()` method is to perform tasks necessary to clean up the resources, such as closing the network connection to a database.

Here is a basic example that implements the interface:
```csharp
public class MyDisposableObject : IDisposable
{
    public void Dispose()
    {
        //Perform cleanup here
    }
}
```

## The `using` Block
We are accustomed to seeing the `using` statement at the top of our C# files in order to reference outside namespaces.  In C#, there is another usage and meaning of `using`.  
```csharp
using(MyDisposableObject do = new MyDisposableObject())
{

}
```
The `using` block, as seen here, is only valid for objects that inherit from the interface `IDisposable`.    When placed in the context of a `using` block, the above code is the equivalent of this:
```csharp
MyDisposableObject do = new MyDisposableObject();
try
{
    //Code which uses connection goes here
}
finally
{
    if(connection != null)
    {
        connection.Dispose();
    }
}
```

### The Significance of try/finally
As the example showed, the `using` block has `try`/`finally` blocks behind the scenes. This is because `finally` blocks will ALWAYS be executed, even if an exception is thrown in `try`/`catch` blocks

### Simplifying it Further
The `using` block we saw originally:
```csharp
using(MyDisposableObject do = new MyDisposableObject())
{
    //Perform operations with our MyDisposableObject
}
```
can also be written like this:
```csharp
using(MyDisposableObject object = new MyDisposableObject());
//Perform operations with our MyDisposableObject
```
In this case, the `finally` block is executed when the `using` statement goes out of scope.  Here are a couple of examples:

**Example 1**
```csharp
public IActionResult Index()
{
    using(MyDisposableObject do = new MyDisposableObject());

    return View();
} //MyDisposableObject is now out of scope and will be disposed
```

**Example 2**
```csharp
public IActionResult Index()
{
    if(true)
    {
        using(MyDisposableObject do = new MyDisposableObject());
    } //MyDisposableObject is now out of scope and will be disposed

    return View();
}
```