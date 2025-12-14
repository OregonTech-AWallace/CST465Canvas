
# IActionResult Interface
You have seen an interface used when defining controller actions:
```csharp
public IActionResult Index()
{
    return View();
}
```

The `IActionResult` interface in ASP.NET Core represents the result of an action method. It defines a contract for action results that can be executed to produce an HTTP response.

## Overview

```csharp
public interface IActionResult
{
    Task ExecuteResultAsync(ActionContext context);
}
```

The interface contains a single method `ExecuteResultAsync` that takes an `ActionContext` and returns a `Task`, allowing for asynchronous execution of the result.

## Common IActionResult Types
Each concreate type will consist of a status code and and optionally additional data.

### View Results
| Result Type | Default Status Code | Description |
|-------------|-------------------|-------------|
| **`ViewResult`** | 200 OK | Renders a view template |
| **`PartialViewResult`** | 200 OK | Renders a partial view |
| **`ViewComponentResult`** | 200 OK | Renders a view component |

### Content Results
| Result Type | Default Status Code | Description |
|-------------|-------------------|-------------|
| **`ContentResult`** | 200 OK | Returns plain text content |
| **`JsonResult`** | 200 OK | Returns JSON-formatted data |
| **`FileResult`** | 200 OK | Returns file content (base class for file-related results) |
| **`FileContentResult`** | 200 OK | Returns file content from byte array |
| **`FileStreamResult`** | 200 OK | Returns file content from stream |
| **`PhysicalFileResult`** | 200 OK | Returns file from physical path |


### Redirect Results

| Result Type | Default Status Code | Description |
|-------------|-------------------|-------------|
| **`RedirectResult`** | 302 Found | Redirects to a URL |
| **`RedirectToActionResult`** | 302 Found | Redirects to another action |
| **`RedirectToRouteResult`** | 302 Found | Redirects using route values |
| **`LocalRedirectResult`** | 302 Found | Redirects to local URL only |

### Status Code Results

| Result Type | Default Status Code | Description |
|-------------|-------------------|-------------|
| **`StatusCodeResult`** | Configurable | Returns specific HTTP status code |
| **`NotFoundResult`** | 404 Not Found | Returns 404 Not Found |
| **`UnauthorizedResult`** | 401 Unauthorized | Returns 401 Unauthorized |
| **`BadRequestResult`** | 400 Bad Request | Returns 400 Bad Request |
| **`OkResult`** | 200 OK | Returns 200 OK |
| **`NoContentResult`** | 204 No Content | Returns 204 No Content |



## Usage Examples
For many of the types implementing IActionResult there are prebuilt methods that are part of the Controller base class which we can use
```csharp
public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View(); // ViewResult
    }
    
    public IActionResult GetData()
    {
        var data = new { Name = "John", Age = 30 };
        return Json(data); // JsonResult
    }
    
    public IActionResult NotFound()
    {
        return NotFound(); // NotFoundResult
    }
}
```
