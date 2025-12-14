# ASP.NET Controllers
Controllers are activated by incoming requsts.  They decide the actions to perform and the model/view to return to the client.

Given the following simple controller:
```csharp
namespace CST465;

public class ArmadilloController : Controller
{
    public IActionResult Index()
    {
        Armadillo armadilloModel = new Armadillo() {Name = "Harvey", Rotundness = 7};
        return View(armadilloModel);
    }
}
```
The following assumptions could be made based on ASP.NET default behavior:
- The path /armadillo/index will cause the method to be executed
- The server will look for a file on the server at /Views/Armadillo/Index.cshtml to use as the View template
- The view will be passed a model of type `Armadillo`

## The View Method
When calling: `return View();`, this method comes from the Controller base class.  Be aware, however, that there are multiple variations of this method. The most common version is `IActionResult View(object model)`  

I mentioned before that any object can be used as a model, and a string is an object.

This code will not behave as intended:
```csharp
IActionResult Index()
{
    string model = "Hello!";
    return View(model);
}
```
The reason is that another variation is `IActionResult View(string? viewName)` which allows you to pass in the view file to load, which will override the default path of `/Views/{controller}/{action}.cshtml`.

In order to pass a string as a model, you must cast it as an object:
```csharp
IActionResult Index()
{
    string model = "Hello!";
    return View((object)model);
}
```