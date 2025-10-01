# ASP.NET Basics
Rather than trying to explain the theory first, we're going to jump right in to the code and dissect what is going on.  The following is an ASP.NET web app.  

```csharp
using Microsoft.AspNetCore.Builder;

var builder = WebApplication.CreateBuilder(args);

var app = builder.Build();

app.MapGet("/", () => "Hello, ASP.NET 9!");

app.Run();
```
The first thought I would expect you to have when looking at the code is "This is obviously not the code for a web server, what's actually going on?"

**Magic**

Okay, not actually magic.

```
var builder = WebApplication.CreateBuilder(args);
```  
**Application Builder**: The application builder in ASP.NET is used to configure and initialize components of the web application. It sets up the request pipeline and registers services and middleware needed for the app to function.  This one line of code is doing the following things under the hood
- Parsing any command-line arguments from args
- Loading default configuration sources such as appsetting.json and environment variables
- Setting up the dependency injection container (more on this later)
- 

- **Kestrel Web Server**: ASP.NET includes Kestrel, a cross-platform web server that is lightweight and fast. It handles HTTP requests and responses, making it suitable for both development and production environments.





- **Built-in Dependency Injection**: ASP.NET provides a built-in dependency injection (DI) framework, allowing you to manage object lifetimes and dependencies efficiently. This promotes loose coupling and easier testing of components.
- **Middleware Request Processing**: Incoming HTTP requests are processed through a series of middleware components. Each middleware can inspect, modify, or handle requests and responses, enabling features like authentication, logging, error handling, and routing.