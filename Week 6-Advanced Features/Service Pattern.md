
# Service Pattern in ASP.NET

The Service pattern is a design pattern that encapsulates business logic and data access operations into dedicated service classes. In ASP.NET, this pattern promotes separation of concerns by keeping controllers thin and moving complex logic into reusable service layers.

## Key Benefits

- **Separation of Concerns**: Controllers handle HTTP requests while services handle business logic
- **Testability**: Services can be easily unit-tested in isolation
- **Reusability**: Service logic can be shared across multiple controllers
- **Maintainability**: Changes to business logic are centralized in service classes

## Implementation in ASP.NET Core
In the following example, we will assume that our application has been given a new requirement to be able to get armadillos based on their general size which would be defined as:
```csharp
enum ArmadilloSize
{
    Any,
    Small,
    Medium,
    Large,
    XLarge
}
```
We already have a repository for getting the data, but the Rotundness value of an armadillo is an integer from 0-10.  This new requirement would fall into the category of **business logic**.  It is rules and interpretations of the actual data.  We don't want to modify our repository in this instance because it is returning the factual data about our armadillos, and what constitutes Small, Medium, Large and XLarge could be prone to change.  Instead, we will define a **service** which allows us to implement this logic.

### 1. Define the Service Interface

```csharp
public interface ISizeableArmadilloService
{
    Armadillo GetArmadillo(string name);
    IEnumerable<Armadillo> GetArmadillosBySize();
}
```
Notice that our service does not provide access to everything in the repository, only the specific things we need to apply additional logic to with regards to sizeable armadillos.

### 2. Implement the Service
Here's the implementation
```csharp
public class ArmadilloService : ISizeableArmadilloService
{
    private readonly IArmadilloRepository _ArmadilloRepo;
    
    public ArmadilloService(IArmadilloRepository armadilloRepo)
    {
        _ArmadilloRepo = armadilloRepo;
    }
    
    public Armadillo GetArmadillo(string name)
    {
        return _ArmadilloRepo.GetArmadillo(name);
    }
    public IEnumerable<Armadillo> GetArmadillosBySize(ArmadilloSize size)
    {
        int minSize, maxSize;
        switch(size)
        {
            case ArmadilloSize.Any:
                minSize = 0;
                maxSize = 10;
            break;
            case ArmadilloSize.Small:
                minSize = 0;
                maxSize = 3;
            break;
            case ArmadilloSize.Medium:
                minSize = 4;
                maxSize = 6;
            break;
            case ArmadilloSize.Large:
                minSize = 7;
                maxSize = 9;
            break;
            case ArmadilloSize.XLarge:
                minSize = 10;
                maxSize = 10;
            break;
        }
        return _ArmadilloRepo.GetList().Where(a => a.Rotundness >= minSize && a.Rotundness <= maxSize);
    }
    
}
```

### 3. Register Service in DI Container

```csharp
// Program.cs
builder.Services.AddTransient<IArmadilloService, ArmadilloService>();
```

### 4. Use the Service in a Controller

```csharp
[ApiController]
[Route("[controller]")]
public class ArmadilloController : ControllerBase
{
    private readonly IArmadilloService _ArmadilloService;
    
    public ArmadilloController(IArmadilloService armadilloService)
    {
        _ArmadilloService = armadilloService;
    }
    
    [HttpGet("list")]
    public async IActionResult GetList()
    {
        IEnumerable<Armadillo> armadillos = _ArmadilloService.GetArmadillosBySize(ArmadilloSize.Small);
        return View(armadillos);
    }
}
```

There you have it, we have a fully implemented service that can be easily tested, maintained, and swapped out as needed.  