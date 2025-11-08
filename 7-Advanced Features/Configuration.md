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

### Adding Your OWn Configuration Source
Because configuration is loaded early in the life-cycle of your application, we must register configuration sources when we are setting up the Web Application builder:

```csharp
builder.Configuration.AddJsonFile("MyConfiguration.json");
```

## Accessing Configuration
