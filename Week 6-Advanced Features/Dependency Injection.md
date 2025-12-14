# Dependency Injection
ASP.NET utilizes **dependency injection** as foundational component of building applications for it.

## Key Terms
**Inversion of Control (IoC)** – A programming methodology where objects are given information about other objects without having to create or control them

**Dependency Injection (DI)** – A design pattern that implements IoC for resolving dependencies.  Usually this occurs by means of the constructor, but can also be done via a setter or a property

**Dependency Injection Container** – An object that stores the mappings of interface types to concrete types and resolves/instantiates them at runtime

## How Does It Work?
Let's explore this concept the same way we've explored several other concepts to this point, using armadillos.  We will move beyond just a simple fascination with them and start building a farm.
```csharp
public class ArmadilloFarm
{
    private List<Armadillo> _FarmAnimals = new ();
    public List<Armadillo> GetAnimals()
    {
        return _FarmAnimals;
    }
}
```
```csharp
[Route("farm")]
public class FarmController : Controller
{
    private ArmadilloFarm _Farm;
    public FarmController()
    {
        _Farm = new ArmadilloFarm();
    }
    [HttpGet("aninals")]
    public IActionResult ShowAnimals()
    {
        return View(_Farm.GetAnimals());
    }
}
```



I can't imagine why this would happen, but let's suppose that our armadillo farm is not doing so well, and we decide to switch to farming possums instead, because surely they will do better.
```csharp
public class PossumFarm
{
    private List<Possum> _FarmAnimals = new ();
    public List<Possum> GetAnimals()
    {
        return _FarmAnimals;
    }
}
```
```csharp
[Route("farm")]
public class FarmController : Controller
{
    private PossumFarm _Farm;
    public FarmController()
    {
        _Farm = new PossumFarm();
    }
    [HttpGet("aninals")]
    public IActionResult ShowAnimals()
    {
        return View(_Farm.GetAnimals());
    }
}
```

Since our FarmController was tightly coupled to the Armadillo farm, we had to do a find and replace all references
Since our FarmController was tightly coupled to the Armadillo farm, we had to do a find and replace all references to ArmadilloFarm with PossumFarm.  In this example, there were only two, but as projects grow the number of references will undoubtedly increase

## How Does Dependency Injection Help?
Dependency Injection 
- allows us to remove the tight coupling of types 
- makes it easier to swap out implementations


### Defining interfaces for our 
We may notice that both farms looked similar, both of them had a method named "GetAnimals()" which serve the same purpose.  We can use interfaces to define the contracts of what it means to be a farm and to be an animal

`IWeighableAnimal.cs`
```csharp
public interface IWeighableAnimal
{
    string Name{get;set;}
    int Rotundness {get;set;}
}
```
`IFarm.cs`
```csharp
public interface IFarm
{
    List<IWeighableAnimal> GetAnimals();
}
```

Now, we can update our FarmController
```csharp
[Route("farm")]
public class FarmController : Controller
{
    private readonly IFarm _Farm;
    public FarmController()
    {
        _Farm = new PossumFarm();
    }
    //ShowAnimals() method omitted for brevity
}
```
Sadly, we have still not gained anything at this point, we are still tightly-coupled because of this line:
```csharp
    _Farm = new PossumFarm();
```
### Using Dependency Injection
```csharp
[Route("farm")]
public class FarmController : Controller
{
    private IFarm _Farm;
    public FarmController(IFarm farm)
    {
        _Farm = farm;
    }
    //ShowAnimals() method omitted for brevity
}
```
We can consider our `FarmController` complete at this point, and `FarmController` is no longer tied to a specific Farm implementation.
![Anakin Padme Conversation about object instantiation](../Images/6/di-anakin.jpg)

  Controllers are automatically instantiated by ASP.NET as needed and participate in dependency injection.  This means that when ASP.NET calls the constructor for FarmController, it will automatically create an instance of the IFarm interface and pass it in.  But interfaces can't be intantiated, so how does it know what an IFarm is supposed to be?

  ### Registering Types for Dependency Injection
  In order for interfaces to get instantiated as a specific type, they must be registered with the dependency injection container. This is done as part of the application startup. 

  `Program.cs`
```csharp
var builder = WebApplication.CreateBuilder(args);

builder.Services.AddTransient<IFarm, ArmadilloFarm>();

var app = builder.Build();
```
That one line now tells the system that anywhere dependency injection is applied, if a constructor asks for an IFarm, instantiate an ArmadilloFarm object and pass that in to the constructor.

## What if ArmadilloFarm has dependencies?
We're going to add another type and modify the definition of ArmadilloFarm slightly
`IAnimalBroker.cs`
```csharp
public interface IAnimalBroker
{
    IWeighableAnimal Buy();
    int Sell(IWeighableAnimal animal);
}
```
`CoastalFarmSupply.cs`
```csharp
public class CoastalFarmSupply : IAnimalBroker
{
    private money _PricePerWeight = 2.55;
    public IWeighableAnimal Buy()
    {
        return new IWeighableAnimal();
    }
    public money Sell(IWeighableAnimal animal)
    {
        return _PricePerWeight * animal.Rotundness;
    }
}
```
`ArmadilloFarm.cs`
```csharp
public class ArmadilloFarm
{
    private List<Armadillo> _FarmAnimals = new ();
    private readonly IAnimalBroker _Broker;
    public ArmadiloFarm(IAnimalBroker broker)
    {
        _Broker = broker;
    }
    public List<Armadillo> GetAnimals()
    {
        return _FarmAnimals;
    }
}
```
  `Program.cs`
```csharp
var builder = WebApplication.CreateBuilder(args);

builder.Services.AddTransient<IFarm, ArmadilloFarm>();
builder.Services.AddTransient<IAnimalBroker, CoastalFarmSupply>();

var app = builder.Build();
```

Here's what the flow will look like with our example:

1. Request comes in to the application specifying the path `/farm/animals`
1. ASP.NET routing determines that `FarmController` should be instantiated
1. ASP.NET discovers required parameters for the `FarmController` constructor
1. ASP.NET looks up `IFarm` in the DI container and determines that `ArmadilloFarm` should be instantiated
1. ASP.NET discovers required parameters for `ArmadilloFarm` constructor
1. ASP.NET looks up `IAnimalBroker` in the DI container and determines that `CoastalFarmSupply` should be instantiated
1. ASP.NET discovers required parameters for `CoastalFarmSupply` and sees that there are none
1. `CoastalFarmSupply` is instantiated
1. `ArmadilloFarm` is instantiated, passing in the new CoastalFarmSupply object
1. `FarmController` is instantiated, passing in the new ArmadilloFarm object
1. `ShowAnimals()` action of the controller is executed
1. Response is returned to the client 

## Dependency Injection Lifetimes
In the previous examples, we registered items with the DI container with this line:
```csharp
builder.Services.AddTransient<IFarm, ArmadilloFarm>();
```
`AddTransient()` probably feels like a pretty foreign method name right now, but it has to do with **when** the objects of this interface will be instantiated.
### Transient
With a **transient** liftime, a new instance is created every time a constructor taking part in dependency injection needs an IFarm.  Transient lifetime is generally preferred for most purposes because the programmer does not have to worry as much about thread safety.

**Example:**
```csharp
builder.Services.AddTransient<IFarm, ArmadilloFarm>();
```

### Scoped
With a **scoped** lifetime, a new instance is created the first time per web request that a constructor taking part in dependency injection needs an IFarm, and that instance is reused only within the scope of that web request. Database contexts will commonly use a scoped lifetime so that the same database connection can be reused across an entire request.
```csharp
builder.Services.AddScoped<IFarm, ArmadilloFarm>();
```
### Singleton
With a **singleton** lifetime, a new instance is created the first time a constructor taking part in dependency injection needs an IFarm, and that instance is reused for the entire lifetime of the application.  Examples of Singleton usage include configuration management and cache management where the same state needs to be accessible to the entire application without frequent reloading from disk.  Extra care must be taken with 
```csharp
builder.Services.AddSingleton<IFarm, ArmadilloFarm>();
```

