# Server-Side Caching
## Data Caching 
Data caching refers to storing commonly used data in low latency storage location such as memory or a caching service such as Redis or Memcached.  With this mechanism data is stored and retrieved via a named key. 
### Example: Using .NET MemoryCache
#### Adding Caching Middleware

Before we can use the cache, we need to register related services at program startup.

`Program.cs`
```csharp
builder.Services.AddMemoryCache();
```

Here's a demonstration of basic data caching using .NET's `IMemoryCache`:
`ArmadilloController.cs`
```csharp
[Route("Armadillos")]
public class ArmadilloController : Controller
{
    private readonly IMemoryCache _Cache;

    /*Set a value for cache prefix.  This will help us prevent issues caused by typoing it later since it will be used a lot.*/
    private const string _CacheKey = "Armadillos";
    
    public ArmadilloController(IMemoryCache cache)
    {
        _Cache = cache;
    }

    [HttpGet("")]
    public IActionResult Index()
    {
        List<Armadillo> armadillos = (List<Armadillo>)_Cache.Get(_CacheKey);
        
        //Let's not worry about making our view messy with null checking.
        return View(armadillos ?? new List<Armadillo>());
    }

    [HttpPost("Add")]
    public IActionResult AddArmadillo(Armadillo armadillo)
    {
        List<Armadillo> armadillos = (List<Armadillo>)_Cache.Get(_CacheKey);
        armadillos = armadillos ?? new List<Armadillo>();
        armadillos.Add(armadillo);

        _Cache.Set(_CacheKey, armadillos);
        return RedirectToAction("Index");
    }
}
```
While this isn't bad, there are some other constructs that can improve upon this:

```csharp
[HttpGet("")]
public IActionResult Index()
{
    _Cache.TryGetValue(_CacheKey, out List<Armadillo> armadillos)
    //Let's not worry about making our view messy with null checking.
    return View(armadillos ?? new List<Armadillo>());
       
}

```
You may be wondering what was gained here other than extra lines of code. The main thing is some extra safety.  In the first example, we are casting the cache entry directly to a `List<Armadillo>`, but what happens if for some reason, that is NOT the type of the object returned?  We will end up with an unhandled exception.  With the second example, it will attempt to return an object of the type expected, but still fail gracefully if it is not what we expect.


### Lifetime
Server-side caching lifetime often falls into three categories: **no expiration**, **fixed expiration** and **sliding expiration**.  The default is **no expiration**
```csharp
[HttpPost("Add")]
    public IActionResult AddArmadillo(Armadillo armadillo)
    {
        _Cache.TryGetValue(_CacheKey, out List<Armadillo> armadillos)
        armadillos = armadillos ?? new List<Armadillo>();
        armadillos.Add(armadillo);

        _Cache.Set(_CacheKey, armadillos);
        return RedirectToAction("Index");
    }
```
In this example
#### Fixed Expiration

This lifetime mechansim functions like the `max-age` scheme seen in client-side caching.   Once the expiration has been reached, the content is removed from the cache and a new copy must be retrieved.
```csharp
[HttpPost("Add")]
    public IActionResult AddArmadillo(Armadillo armadillo)
    {
        _Cache.TryGetValue(_CacheKey, out List<Armadillo> armadillos)
        armadillos = armadillos ?? new List<Armadillo>();
        armadillos.Add(armadillo);

        _Cache.Set(_CacheKey, armadillos, TimeSpan.FromHours(1));        
        return RedirectToAction("Index");
    }
```
#### Sliding Expiration
Sliding expiration sets an expiration time, but each time the content is requested before the expiration is reached, the expiration time is reset.  When using this mechanism, it would theoretically be possible for an item to remain in the cache forever.
```csharp
[HttpPost("Add")]
    public IActionResult AddArmadillo(Armadillo armadillo)
    {
        _Cache.TryGetValue(_CacheKey, out List<Armadillo> armadillos)
        armadillos = armadillos ?? new List<Armadillo>();
        armadillos.Add(armadillo);

        var cacheEntryOptions = new MemoryCacheEntryOptions
        {
            SlidingExpiration = TimeSpan.FromMinutes(15)
        };
        
        _Cache.Set(_CacheKey, armadillos, cacheEntryOptions);        
        return RedirectToAction("Index");
    }
```

#### Combination of Fixed and Sliding
Another common scenario is a combination of fixed and sliding expiration. This will keep frequently used content from being dropped from the cache, but also still have a maximum limit before a fresh copy must be retrieved.
```csharp
[HttpPost("Add")]
    public IActionResult AddArmadillo(Armadillo armadillo)
    {
        _Cache.TryGetValue(_CacheKey, out List<Armadillo> armadillos)
        armadillos = armadillos ?? new List<Armadillo>();
        armadillos.Add(armadillo);

        var cacheEntryOptions = new MemoryCacheEntryOptions
        {
            SlidingExpiration = TimeSpan.FromMinutes(15),
            AbsoluteExpirationRelativeToNow = TimeSpan.FromHours(2)
        };
        
        _Cache.Set(_CacheKey, armadillos, cacheEntryOptions);
        return RedirectToAction("Index");
    }
```

### Cache Invalidation
If you wish to force something out of the cache, you can use the `Remove()` method:
```csharp
_Cache.Remove(_CacheKey);
```
This is very useful when you implement a caching layer on top of a repository.  It would be wasteful of processing cycles to save an item in the database and then retrieve it immediately in order to refresh the cache, and would also force the retrieval logic to be called in multiple places.

## Output Caching
Output caching refers to storing a copy of the rendered page on the web server.  This is the same concept as **Response Caching** with the distincition that  **output caching** in a ASP.NET is handled internal to the web application whereas typical **response caching** is carried out by the web browser, or by some other component of the infrastructure like a reverse proxy or content delivery network.

### Lifetime
In ASP.NET, the **output cache** only supports a fixed expiration.  This is facilitied through the use of the `Duration` parameter.
```csharp
[OutputCache(Duration = 60)]
public IActionResult Index()
{
    // ...
    return View();
}
```
### Cache Invalidation
Invalidation of output cache objects is handled through tags.  Each output cache entry can register any number of tags that it is associated with.
```csharp
[OutputCache(Duration = 60, Tags = new[] { "armadillos" })]
public IActionResult Index()
{
    // ...
    return View();
}
```
If another part of your application makes an update affecting the list of armadillos, for example, it could then clear the output cache for all entries that use that specific tag:
```csharp
await HttpContext.OutputCache.EvictByTagAsync("armadillos");
```