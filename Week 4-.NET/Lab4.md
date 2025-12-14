# Lab 4 - Getting Started with ASP.NET MVC
For Lab 4, we're going to build on top of what was already created in Lab 3.  
## Basic MVC Setup
1. Open the Lab3/dotnetlab folder with VS Code
1. Add three folders to your project:
    - Models
    - Views
    - Controllers

1. Edit the project file, `dotnetlab.csproj` and add the following lines inside of the `<project>` element.
    ```xml
    <ItemGroup>
        <using Include="Microsoft.AspNetCore.Mvc" />
    </ItemGroup>
    ```
    The same could also be done by adding the following line to any of your code files, but I think keeping it in the project file is cleaner.
    ```csharp
    global using Microsoft.AspNetCore.Mvc;
    ```

1. Add a new file named `HomeController.cs` to the `Controllers` folder and add the following code
    ```csharp
    //IMPORTANT! Everything will build and execute without a namespace, but only namespaced controllers will get discovered automatically by ASP.NET
    namespace Lab4;

    public class HomeController : Controller
    {
        public IActionResult Index() 
        {
            return View(); 
        }
    }
    ```
1. Add a new folder named `Home` to the `Views` folder.
1. Add a new file named `Index.cshtml` to the `Home` folder.
1. Add all of the components needed for a valid HTML page to this file.

1. Try and run the project and open it in the browser.  Your web app likely still only returns "Hello world", so let's fix that.

1. Modify your `Program.cs` as follows:
    ```csharp
    var builder = WebApplication.CreateBuilder(args);
    //Add services needed to handle MVC Controlers and Views
    builder.Services.AddControllersWithViews();

    var app = builder.Build();

    app.MapDefaultControllerRoute();
    //The abolve line is equivalent to this:
    //app.MapControllerRoute(
    //    name: "default",
    //    pattern: "{controller=Home}/{action=Index}/{id?}");

    app.Run();
    ```
1. Run the application now, and you should now see your page displayed.

## Now Let's Build Something
Create two new files in your `Models` folder.  You will need to add appropriate namespacing for your project.

ChoreLaborer.cs
```csharp
public class ChoreLaborer
{
    public string Name {get;set;}
    public int Age {get;set;}
    public int Difficulty 
    {
        get{
            return _Difficulty;
        } 
        set{
            if(value < 0)
            {
                _Difficulty = 0;
            }
            else if(value > 10)
            {
                _Difficulty = 10;
            }
            else
            {
                _Difficulty = value;
            }
        }
    }
    private int _Difficulty;
}
```
ChoreWorkforce.cs
```csharp

namespace Lab4.Models;

public class ChoreWorkforce
{
    public List<ChoreLaborer> Laborers{get;} = new List<ChoreLaborer>();
}
```


Add a new file to the `Views/Home` folder.  You will need to adjust the first line based on your namespacing.

Laborers.cshtml
```html
@model Lab4.Models.ChoreWorkforce

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Chore Laborers</title>
    </head>
    <body>
        <h1>Chore Laborers</h1>
        <ul>
        @foreach(var laborer in Model.Laborers)
        {
            <li>@laborer.Name is @laborer.Age years old and ranks a @laborer.Difficulty on the difficulty scale</li>
        } 
        </ul>
    </body>
</html>
```

Edit `Controllers/HomeController.cs` and add a new method like the following:
```csharp
public IActionResult Laborers()
```

It should:
- Initialize a new ChoreWorkforce object
- Add 4 ChoreLaborer objects to the workforce.  This can be done in 4 statements, using a simplified format like this:
```csharp
myWorkforce.Laborers.Add(new ChoreLaborer(){   Name = "Bob", Age = 7, Difficulty = 5 });
```
The method should return the following:
```csharp
return View(myWorkforce);
```

If all is working, you should be able to run your project and navigate to /Home/Laborers and see the laborers you created.

## Create an Extension Method
There is documentation on extension methods here: https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/how-to-implement-and-call-a-custom-extension-method

- Create a folder named ExtensionMethods in your dotnetlab folder
- Add a file named `ChoreExtensions.cs`
- Add two extension methods for the ChoreWorkforce type.
    - The first will be named "AddLaborer" and will take parameters for each of the Laborer properties. It will create a new Laborer object/add it to the list. All parameters for the extension method would come after the "this" parameter in the parameter list

    - The second will be named AddRandomLaborer and will take no parameters.  This extension method will pick from a list of 11 names that you will decide upon and randomly set all of the other properties.  I recommend using the "Random" class that is part of the .NET System namespace.  https://docs.microsoft.com/en-us/dotnet/api/system.random?view=net-9.0 

    - Keep in mind when picking random values that Difficulty is constrained between 1 and 10 and your labor workforce won't likely be available after the age of 18

- In a loop, add 30 random laborers to the list in addition to what you have already added.

## Making it Interesting with LINQ
Now that we have our methods built, let's do some playing around with the LINQ Where and OrderBy functions. 

https://docs.microsoft.com/en-us/dotnet/api/system.linq.enumerable.where?view=net-9.0

https://docs.microsoft.com/en-us/dotnet/api/system.linq.enumerable.orderby?view=net-9.0

In the Laborers method of HomeController, filter the list to only those that are between the ages of 3 and 10 and have a difficulty of 7 and under, then order the list by name.  Return the filtered/ordered list via the View() function.

## Dealing with NULLs

Now it's time to introduce some dreaded null values to deal with.  Modify the AddRandomLaborer extension method. If the Difficulty is 10, add 'null' to the collection instead.  If you run your program again, things may end up broken because we will be evaluating properties of a null object in our Where clauses.  Use knowledge gained from the Week 4 content on Dealing with nulls to remedy this.




When completed, see me to get your lab checked off.  Then, commit the lab files to your repository push to GitHub.