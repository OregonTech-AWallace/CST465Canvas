
# Building a Simple Web Service in ASP.NET Core

Here's an example of creating a web service controller that returns a list of `Armadillo` objects.


```csharp
[ApiController]
[Route("api/[controller]")]
public class ArmadilloController : ControllerBase
{
    [HttpGet]
    public IEnumerable<Armadillo> GetArmadillos()
    {
        var armadillos = new List<Armadillo>
        {
            new Armadillo { Name = "Speedy", Rotundness = 3 },
            new Armadillo { Name = "Tank", Rotundness = 7 },
            new Armadillo { Name = "Rolly", Rotundness = 10 }
        };

        return armadillos;
    }

    [HttpGet("{name}")]
    public Armadillo GetArmadillo(string name)
    {
        var armadillo = GetArmadillos().FirstOrDefault(a => a.Name == name);
        
        return armadillo;
    }
}
```
The service will be accessible at:
- `GET /api/armadillo` - Returns all armadillos
- `GET /api/armadillo/{name}` - Returns specific armadillo by name

## Items of Interest
- `[ApiController]` Attribute 
    This enables automatic model validation and binding for the controller when building APIs.  Previously, we relied on checking `ModelState.IsValid`.  With this attribute in place, the API will automatically return a status code `400 Bad Request` if the model is not valid.

- **Base Class**  
    Notice that we are inheriting from `ControllerBase` instead of `Controller` like we have done previously.  `Controller` inherits from `ControllerBase` also, but since we do not need any of the MVC-related functions from that implementation such as `View()`, we are going to use a simpler base class with less overhead.

- **Return Type**  
    When building a simple API, it is possible to return the raw objects and ASP.NET will automatically serialize them as JSON.  While it is cool that we can return objects directly, this is really not best practice when creating APIs

![Just because you can doesn't mean you should](../../Images/9/couldvsshould.jpg)
(Jurassic Park: The Lost World, 1997)

We learned in the section on RESTful APIs that how we structure the response is just as important as how we structure the request.  In the above request, if the user requests an `Armadillo` that does not exist, it will give back a status code of `200 OK`, but the data will be null. This is not optimal.  

Here is a better way:
```csharp
[ApiController]
[Route("api/[controller]")]
public class ArmadilloController : ControllerBase
{
    [HttpGet]
    public ActionResult<IEnumerable<Armadillo>> GetArmadillos()
    {
        var armadillos = new List<Armadillo>
        {
            new Armadillo { Name = "Speedy", Rotundness = 3 },
            new Armadillo { Name = "Tank", Rotundness = 7 },
            new Armadillo { Name = "Rolly", Rotundness = 10 }
        };

        return Ok(armadillos);
    }

    [HttpGet("{name}")]
    public ActionResult<Armadillo> GetArmadillo(string name)
    {
        var armadillo = GetArmadillos().Value?.FirstOrDefault(a => a.Name == name);
        
        if (armadillo == null)
            return NotFound();

        return Ok(armadillo);
    }
}
```
This implementation allows us to specify the data to return **AND** a status code.

