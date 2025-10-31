# ASP.NET Routing
We have already looked an example of basic routing already:
```csharp
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");
```
We could also use this format to map a static route to a controller with a different name:
```csharp
app.MapControllerRoute(
    name: "news",
    pattern: "news/{storyTitle}",
    controller: "News",
    action: "Index"
    );
```
This route definition limits what can be accessed so that only the Index action of the News controller can ever be accessed.  Only one variable can be specified at this route, which is `storyTitle` and would allow for a URL like this:
http://localhost/news/hootie-is-awesome
The corresponding action 

## Attribute Routing

Attribute routing is a routing mechanism in ASP.NET that allows developers to define routes directly on controller actions using attributes, rather than configuring routes in a central routing table. This approach provides more control and flexibility over URL patterns and makes routing configuration more explicit and maintainable.

## Key Features

- **Declarative routing**: Define routes directly on actions using attributes
- **Route constraints**: Apply constraints to route parameters for validation
- **Route ordering**: Control the order in which routes are matched
- **Route naming**: Assign names to routes for URL generation
- **Parameter binding**: Automatically bind URL segments to action parameters

## Basic Usage

### Enabling Attribute Routing

Attribute routing must be enabled in the route configuration:
`Program.cs`
```csharp
var builder = WebApplication.CreateBuilder(args);

// Add services to the container
builder.Services.AddControllersWithViews();

var app = builder.Build();

// Configure the HTTP request pipeline
app.UseRouting();
app.MapControllers(); // Enables attribute routing

app.Run();
```

### Basic Route Attributes

Use the `[Route]` attribute to define custom routes:

```csharp
public class ProductsController : Controller
{
    [Route("products")]
    public IActionResult Index()
    {
        return View();
    }

    [Route("products/{id:int}")]
    public IActionResult Details(int id)
    {
        return View();
    }

    [Route("products/create")]
    [HttpGet]
    public IActionResult Create()
    {
        return View();
    }
}
```

### HTTP Verb Attributes

Combine routing with HTTP verb constraints:

```csharp
[HttpGet("api/products")]
public IActionResult GetProducts() { }

[HttpPost("api/products")]
public IActionResult CreateProduct() { }

[HttpPut("api/products/{id}")]
public IActionResult UpdateProduct(int id) { }

[HttpDelete("api/products/{id}")]
public IActionResult DeleteProduct(int id) { }
```

### Route Parameters and Constraints

Apply constraints to route parameters:

```csharp
[Route("products/{id:int:min(1)}")]
public IActionResult Details(int id) { }

[Route("products/{category:alpha}")]
public IActionResult ByCategory(string category) { }

[Route("products/{date:datetime}")]
public IActionResult ByDate(DateTime date) { }
```

### Controller-Level Routing

Define base routes at the controller level:

```csharp
[Route("api/[controller]")]
public class ProductsController : Controller
{
    [HttpGet] // Maps to: GET /api/products
    public IActionResult Get() { }

    [HttpGet("{id}")] // Maps to: GET /api/products/{id}
    public IActionResult Get(int id) { }
}
```

## Common Route Constraints

| Constraint | Description | Example |
|------------|-------------|---------|
| `int` | Integer values | `{id:int}` |
| `bool` | Boolean values | `{flag:bool}` |
| `datetime` | DateTime values | `{date:datetime}` |
| `decimal` | Decimal values | `{price:decimal}` |
| `double` | Double values | `{value:double}` |
| `float` | Float values | `{value:float}` |
| `guid` | GUID values | `{id:guid}` |
| `long` | Long integer values | `{id:long}` |
| `min(value)` | Minimum value | `{id:int:min(1)}` |
| `max(value)` | Maximum value | `{id:int:max(100)}` |
| `range(min,max)` | Value range | `{id:int:range(1,100)}` |
| `alpha` | Alphabetic characters | `{name:alpha}` |
| `regex(expression)` | Regular expression | `{name:regex(^[a-z]+$)}` |

## Best Practices

- Use meaningful route patterns that reflect your application structure
- Apply appropriate constraints to validate route parameters
- Keep routes simple and readable
- Use controller-level routes for common prefixes
- Consider route ordering when multiple routes might match
- Use named routes for complex URL generation scenarios
