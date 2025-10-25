# ASP.NET Models
In C#, any POCO (Plain Old C# Object) can be used as a model.  


```csharp
namespace CST465;

public class Armadillo
{    
    public string Name {get;set;} //Do people actually name armadillos?
    public int Rotundness {get;set;} = 5; //Seems like a reasonable default
}
```

```csharp
public class ArmadilloController : Controller
{
    public IActionResult Index()
    {
        Armadillo armadilloModel = new Armadillo() {Name = "Harvey", Rotundness = 7};
        return View(armadilloModel);
    }
}
```