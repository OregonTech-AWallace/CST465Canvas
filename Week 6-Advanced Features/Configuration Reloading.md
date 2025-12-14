# Configuration Reloading
The previous example we looked at works great for the majority of use cases.  The configuration is loaded when the app starts, and is available throughout the app.  One down-side to the previous example, however, is that if you make a change to your custom config file, it will not be reflected until you restart the application.  

## Reload on Change
There's a setting that may have caught your attention when adding the custom configuration file: reloadOnChange.  This enables exactly the behavior you might think.  When set to `true`, it enables the configuration to be updated in the application when the file changes:
```csharp
builder.Configuration.AddJsonFile("StudentConfig.json", optional: false, relaodOnChange: true);
```

With this change, if you rebuild your app and run it, then change the config while it's running you'll notice...**nothing changes**.  

What?!  

That setting merely enables reloading the config file, but there is a very important detail holding you back.

### IOptions Lifetime
The IOptions interface, which is responsible for holding the config, is registered for you automatically in the dependency injection container and has a **singleton lifetime**.  That means that after the first time it is loaded, your application will never load it again.

### IOptionsSnapshot
In order to get our config to behave the way we expect, another interface is provided: `IOptionsSnapshot`.  This interface is registered in the dependency ijection container with a **scoped lifetime**, meaning a new instance will be created and used for the duration of **each web request**.  

`HomeController.cs`
```csharp
public class HomeController : Controller
{
    private readonly StudentConfig _Config;
    public HomeController(IOptionsSnapshot<StudentConfig> config)
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

As you can see, we still use it exactly the same way, but now each change to our configuration will be reflected in the very next request.