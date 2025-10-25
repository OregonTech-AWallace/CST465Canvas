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
Download the following two files and place them in your `Models` folder.  
- [ChoreLaborer.cs](../Files/Lab4/ChoreLaborer.cs)
- [ChoreWorkforce.cs](../Files/Lab4/ChoreWorkforce.cs)

Download the following file and place it in your `Views/Home` folder
- [Laborers.cshtml](../Files/Lab4/Laborers.cshtml)

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


## Implementing this in Django
Sticking with the theme of Lab 3, we are now going to provide similar functionality in Django.  We will simplify things a bit so that we just get a feel for how Django is different

1. Open the Lab3/djangolab folder in VS Code
1. Add a file named `models.py` to `Lab3/djangolab/djangolab` and put in this content
```python
class ChoreLaborer:
    def __init__(self, name="", age=0, difficulty=0):
        self.name = name
        self.age = age
        self._difficulty = 0
        self.difficulty = difficulty  # Use property setter
    
    @property
    def difficulty(self):
        return self._difficulty
    
    @difficulty.setter
    def difficulty(self, value):
        if value < 0:
            self._difficulty = 0
        elif value > 10:
            self._difficulty = 10
        else:
            self._difficulty = value
    
    def __str__(self):
        return self.name

class ChoreWorkforce:
    def __init__(self):
        self.laborers = []
    
    def add_laborer(self, laborer):
        self.laborers.append(laborer)
```
1. Add a file named `views.py` to `Lab3/djangolab/djangolab` and put in this content
```python
from django.shortcuts import render
from .models import ChoreLaborer, ChoreWorkforce

def index(request):
    return render(request, 'chores/index.html')

def laborers(request):
    # Manually create ChoreLaborer objects
    workforce = ChoreWorkforce()
    
    # Add some sample laborers
    laborer1 = ChoreLaborer("Alice", 25, 7)
    laborer2 = ChoreLaborer("Bob", 30, 4)
    laborer3 = ChoreLaborer("Charlie", 22, 9)
    
    workforce.add_laborer(laborer1)
    workforce.add_laborer(laborer2)
    workforce.add_laborer(laborer3)
    
    context = {
        'workforce': workforce
    }
    return render(request, 'chores/laborers.html', context)
```

When completed, see me to get your lab checked off.  Then, commit the lab files to your repository push to GitHub.