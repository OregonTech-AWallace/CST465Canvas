# ASP.NET Identity
ASP.NET ships with a number of pre-built libraries geared towards autenticating and authorizing users.  
## Overview
- A provider implementation that uses Entity Framework/SQL Server for built-in authentication

- Uses the Code-First ORM methodology

- Allows easy integration with third-party authentication systems such as Facebook, Twitter, Google, and LinkedIn


## Adding Identity to a Project
This documentation has historically changed very frequently, so rather than trying to keep it up-to-date, I am simply providing links to documentation on Microsoft's website. If you scaffold identity using the wizard in Visual Studio, it will ask you which files you wish to override.  While we are learning identity, I recommend using the "Override all files" in order to get access to modify any of the out-of-the-box templates.

[Adding Identity to an Existing Project](https://learn.microsoft.com/en-us/aspnet/core/security/authentication/scaffold-identity?view=aspnetcore-9.0&tabs=visual-studio#scaffold-identity-into-an-mvc-project-without-existing-authorization)


## Setting Up the Database Connection
If you follow the steps  above and get to the section on applying the entity framework migrations, one thing to note is that it will apply them to a "localdb" database instance, the connection string of which is placed in the appsettings.json file.  If you want to use the SQL Server instance set up for you in this class, I recommend moving the connection string definition to your User Secrets file and replacing it with the string you used in Lab 6.  After that, you can run the commands to create the database schema.

## Setting up Authentication and Authorization Middleware
When you set

`Program.cs`
```csharp
var builder = WebApplication.CreateBuilder(args);
//The following two lines were likely added by the identity scaffolding process in the previous steps, where mvcContext is the name of the context class you defined and mvcUSer is the name of the user class you defined.
builder.Services.AddDbContext<mvcContext>(options => options.UseSqlServer(connectionString));

builder.Services.AddDefaultIdentity<mvcUser>(options => options.SignIn.RequireConfirmedAccount = true).AddEntityFrameworkStores<mvcContext>();

var app = builder.Build();

app.UseRouting();

//The ordering of Authentication/Authorization middleware is important!
app.UseAuthentication();
app.UseAuthorization()
//...
app.Run();

```

## Checking User Authentication
The `Controller` base class has a property named `User` which allows you to retrieve information about the logged in user.
- **User.Identity.IsAuthenticated** - will tell you if the user is logged in or not

- **User.Identity.Name** - If the user is logged in, it will return the username.  

- **User.Identity** - Can be cast as a ClaimsIdentity object in order to get data about claims generated from the Identity Provider

```csharp
public class ArmadilloController : Controller
{
    
    public IActionResult Index()
    {
        if(User.Identity.IsAuthenticated)
        {
            Armadillo armadilloModel = new Armadillo() {Name = User.Identity.Name, Rotundness = 7};
            return View(armadilloModel);
        }
        else
        {
            Armadillo armadilloModel = new Armadillo() {Name = "Harvey", Rotundness = 7};
            return View(armadilloModel);
        }
    }
}
```

## Requiring Authorization
In it's simplest form, you can require that a user be logged in by adding the [Authorize] attribute in your controller.  It can be applied to individual controller actions, or to the controller as a whole.

`ArmadilloController.cs` (Applied to single action)
```csharp
public class ArmadilloController : Controller
{
    [Authorize]
    public IActionResult Index()
    {
        Armadillo armadilloModel = new Armadillo() {Name = "Harvey", Rotundness = 7};
        return View(armadilloModel);
    }
}
```
`ArmadilloController.cs` (Applied to all actions on controller)
```csharp
[Authorize]
public class ArmadilloController : Controller
{
    
    public IActionResult Index()
    {
        Armadillo armadilloModel = new Armadillo() {Name = "Harvey", Rotundness = 7};
        return View(armadilloModel);
    }
}
```


## Checking Authorization in a View
If you want to conditionally display items in a view based on authorization, this can be done very easily as well 

```html
@if (User.Identity.IsAuthenticated)
{
    <p>Welcome, @User.Identity.Name!</p>
    <a href="/Account/Logout">Logout</a>
}
else
{
    <p>Please log in to continue.</p>
    <a href="/Account/Login">Login</a>
}
```

You can also check for specific roles(if roles are configured in your application, but we haven't talked about this yet.)
```html
@if (User.IsInRole("Admin"))
{
    <a href="/Admin/Dashboard" class="btn btn-primary">Admin Dashboard</a>
}
```