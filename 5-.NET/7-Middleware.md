# Middleware
In the ASP.NET request pipeline, middleware is all of the software that lives between the incoming request from the client, and the outgoing response back to the client.

![ASP.NET Request Pipeline](../Images/4/RequestPipeline.png)
## Using Middleware
```csharp
var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();
//Middleware is registered here
//Most middleware is registered with a call to app.Use<Something>() such as
//app.UseStaticFiles();
app.Run();
```
## Common Middleware
Here's example registrations of a few prewritten middleware components, but there are MANY more. 
```csharp
//Allow plain files to be served.  These come from wwwroot by default, but can be configured to look for them elsewhere
app.UseStaticFiles();
```
```csharp
//When an exception occurs, show error details for debugging. This gets added automatically as of ASP.NET 6
app.UseDeveloperExceptionPage(); 
```
```csharp
//Similar to above, except gives better formatting for database errors from EntityFramework
app.UseDatabaseErrorPage();
```
```csharp
//Redirect the user to a specific location when an error occurs
app.UseExceptionHandler("/Home/Error");
```
```csharp
//Redirect requests from "http" to "https"
app.UseHttpsRedirection();
```
## A Simple Custom Middleware
You can also write your own middleware
```csharp
public class SimpleMiddleware
{
    private readonly RequestDelegate _next;

    public SimpleMiddleware(RequestDelegate next)
    {
        _next = next;
    }

    public async Task InvokeAsync(HttpContext context)
    {
        //Execute code to run before passing the request on to the next middleware
        // Call the next middleware in the pipeline
        await _next(context);
        //Execute code to run after 
    }
}
```
We have now defined a middleware, but how do we register it? It seems like all of the cool kids are using the app.Use<something>() structure.

## Registering Custom Middleware
Extension Methods are the solution, and are in fact how all of the existing `Use` methods are implemented.
```csharp
namspace MyNamespace;
public static class MiddlewareExtensions
{
    
    public static IApplicationBuilder UseSimpleMiddleware(this IApplicationBuilder builder)
    {
        return builder.UseMiddleware<SimpleMiddleware>();
    }

}
```
Now we can register it.

```csharp
using MyNamespace;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.UseSimpleMiddleware();

app.Run();
```

## Middleware Order
After looking at the drawing at the beginning of this topic, and then seeing how a custom middleware is implemented, you may be wondering if the registration order matters.  The answer is a definitive "YES!".  Some middleware, for example authentication and authorization middleware, must be executed in the correct location in the pipeline to work properly.