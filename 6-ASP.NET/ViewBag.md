# ViewBag and ViewData 
Sometimes you have a model associated with a view, but you need another way to get data from the controller to the view where the data does not make sense to be a part of the model.

Both ViewBag and ViewData are ways to pass data from a controller to a view for the current request. They are lightweight, not strongly typed, and best for small pieces of information (messages, flags, simple values).

## ViewData
**Type:** ViewDataDictionary (key/value dictionary).

**Usage:** controller sets values by string keys; view reads by key.

**Example:**
```csharp
// Controller
public IActionResult Index()
{
    ViewData["Message"] = "Hello from ViewData";
    return View();
}
```
```cshtml
<!-- View -->
<h1>@ViewData["Message"]</h1>
```
- Requires casting when reading complex types: `var model = ViewData["Item"] as MyType;`

## ViewBag
**Type:** dynamic (if you're not familiar, check out [https://www.tutorialsteacher.com/csharp/csharp-dynamic-type](https://www.tutorialsteacher.com/csharp/csharp-dynamic-type))

**Usage:** acts as a wrapper around ViewData.controller assigns dynamic properties; view reads them directly.

**Example:**
```csharp
// Controller
public IActionResult Index()
{
    ViewBag.Message = "Hello from ViewBag";
    return View();
}
```
```cshtml
<!-- View -->
<h1>@ViewBag.Message</h1>
```
- No compile-time checking (typos and wrong types can cause runtime errors).

### Notes and best practices
- Both are scoped to the `current request` and implemented via the same underlying ViewDataDictionary.
- For redirects or cross-request persistence, use TempData instead.
- Prefer strongly typed view models for complex views, as they provide compile-time safety and clearer contracts between controller and view.
- Partial views inherit ViewData by default; be explicit if isolation is desired.
- Use ViewBag/ViewData for quick, small values (titles, status messages). For structured data, use view models.