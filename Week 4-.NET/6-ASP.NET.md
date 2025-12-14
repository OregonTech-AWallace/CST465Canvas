# ASP.NET
An empty web application gives you only 4 lines of code, yet somehow spins up a full web server.  How does it doe this?
```csharp
var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();
app.MapGet("/", () => "Hello World!");
app.Run();
```
**MAGIC!**

![Wizard of Oz Magic](../Images/4/Magic.jpg)

Well, maybe not magic.  Let's look behind the curtain.

![Wizard of Oz Toto opens wizard's curtain](../Images/4/open-curtain.webp)
### Line 1
```csharp
var builder = WebApplication.CreateBuilder(args);
```
There is a lot that happens in this step:
- Standard settings are collected
    - args - the command line arguments
    - ContentRootPath is set, which defaults to Directory.GetCurrentDirectory()
    - The ApplicationName is extracted from the assembly containing the program entry point
    - The EnvironmentName variable from either DOTNET_ENVIRONMENT or ASPNETCORE_ENVIRONMENT

- A HostApplicationBuilder is constructed
- The Dependency Injection Container is Configured
    - A service collection is created which maps interfaces to concrete types and objects.
    - A ServiceProviderFactory is created which allows for instantiation of the concrete types as needed
- Configuration is loaded
    - Loads configuration from appsettings.json
    - Loads configuration from appsettings.{EnvironmentName}.json
    - Loads environment variables
    - Loads command-line arguments
- Logging providers are added
    - Adds Console, Debug and EventSource providers
- Core Services are added
    - Registers core services such as IHostEnvironment, IWebHostEnvironment, Routing, Kestrel, etc.

## Line 2
```csharp
var app = builder.Build();
```

- The Dependency Injection Container is Created in this call
    ```csharp
    var serviceProvider = ServiceProviderFactory.CreateServiceProvider(Services);
    ```
- The WebApplication instance is created
- The middleware pipeline is prepared

## Line 3
```csharp
app.MapGet("/", () => "Hello World!");
```
This registers a simple middleware which listens for a request with the method "GET" at the path "/". If matched, it calls an anonymous function that returns the string "Hello World!" in the Response.  Replacing this piece of middleware is usually one of the first things that will be done, but we'll get to that later.

## Line 4
```csharp
app.Run();
```
This starts up the web server and enacts the pipeline. It turns your web application loose, which is why it is the last line of the program.

## Feeling lost?
We've introduced a lot of new concepts here.  Don't worry, they should start to sink in the more we work with it.