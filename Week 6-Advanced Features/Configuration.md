# Configuration in ASP.NET
The default configuration file used by ASP.NET web applications is called appsettings.json
Settings configured in this file are accessible throughout your app.

## Environment-specific Settings
You can also create environment-dependent configurations by naming the files with the convention: `appsettings.<environment>.json`
`<environment>` references the ASPNETCORE_ENVIRONMENT setting that you would find in `Properties/launchSettings.json`

## Configuration Sources
While appsettings.json is heavily used convention, configuration can actually be divided into any number of sources, including but not limited to: host environment variables, xml files, ini files, and other JSON files.  In fact, a number of sources come pre-configured out-of-the-box:
- Command-line arguments using the Command-line configuration provider.
- Non-prefixed environment variables using the Non-prefixed environment variables configuration provider.
- User secrets when the app runs in the Development environment.
- appsettings.{Environment}.json using the JSON configuration provider. For example, appsettings.Production.json and appsettings.Development.json.
- appsettings.json using the JSON configuration provider.
- A fallback to the host configuration

### Adding Your Own Configuration Source
Because configuration is loaded early in the life-cycle of your application, we must register configuration sources when we are setting up the Web Application builder:

#### JSON File
```csharp
builder.Configuration.AddJsonFile("StudentConfig.json", optional: false, reloadOnChange: false);
```
#### XML File
```csharp
builder.Configuration.AddXmlFile("StudentConfig.xml", optional: false, reloadOnChange: false);
```
## Accessing Configuration
```csharp
public class HomeController : Controller
{
    private readonly IConfiguration _Config;
    public HomeController(IConfiguration config)
    {
        _Config = config;
    }
    public IActionResult Index()
    { 
        return View();
    }
}
```
We learned about **dependency injection** in the last section, and that is exactly how we're getting access to it.

Let's build a configuration and use it:

`StudentConfig.json`
```json
{
    "StudentConfig": {
        "Major": "Software Engineering Technology",
        "FavoriteClass": "CST465",
        "Campus": "Online"
    }
}
```

`Program.cs`
```csharp
var builder = WebApplication.CreateBuilder(args);
builder.Configuration.AddJsonFile("StudentConfig.json", optional: false, relaodOnChange: false);
//Other registrations
var app = builder.Build();
//Rest middleware/app setup
```
`HomeController.cs`
```csharp
public class HomeController : Controller
{
    private readonly IConfiguration _Config;
    public HomeController(IConfiguration config)
    {
        _Config = config;
    }
    public IActionResult Index()
    {
        string major = _Config["StudentConfig:Major"]; 
        return View((object)major);
    }
}
```

As you can see, we were able to access our configuration using the _Config interface, and using an indexer to access the config. Colons are used to access deeper levels of config hierarchy.  While this might be perfectly fine for grabbing one or two settings, it would be very cumbersome if we were storing a lot of config, and also very prone to typing errors.

## Mapping Configuration to a Class
Fortunately, we have a way to make configuration even easier.  ASP.NET has built-in functionality to allow us to map that JSON file to an object we can use, giving us compile-time checking and intellisense.  Here's how:

`StudentConfig.cs`
```csharp
public class StudentConfig
{
    public string Major {get;set;}
    public string FavoriteClass{get;set;}
    public string Campus {get;set;}
}
```

`Program.cs`
```csharp
var builder = WebApplication.CreateBuilder(args);
builder.Configuration.AddJsonFile("StudentConfig.json", optional: false, relaodOnChange: false);
builder.Services.Configure<StudentConfig>(builder.Configuration.GetSection("StudentConfig"));
//Other registrations
var app = builder.Build();
//Rest middleware/app setup
```
`HomeController.cs`
```csharp
public class HomeController : Controller
{
    private readonly StudentConfig _Config;
    public HomeController(IOptions<StudentConfig> config)
    {
        _Config = config.Value;
    }
    public IActionResult Index()
    {
        string major = _Config.Major; 
        return View((object)major);
    }
}
```
So cool!