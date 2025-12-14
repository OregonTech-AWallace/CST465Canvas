# The Decorator Pattern

We recently looked at an implementation of `IArmadilloRepository`.  With it fully implemented, what do we do if we want to add functionality? We could the repository itself, but that isn't always the best option.  Another scenario might be that we are using a repository from a NuGet package that we can't modify

.NET provides a pattern to allow us to build upon an implementation without modifying the existing object.  This is known as the **decorator pattern**. Let's look at how we can use the **decorator pattern** to add caching to our repository.

```csharp
public class CachingArmadilloRepository : IArmadilloRepository
{
    private readonly IArmadilloRepository _ArmadilloRepo;
    private readonly IMemoryCache _Cache;
    private const string _CacheKey = "armadillos";

    public CachingArmadilloRepository(IArmadilloRepository armadilloRepo, IMemoryCache cache)
    {
        _ArmadilloRepo = armadilloRepo;
        _Cache = cache;
    }
    public IEnumerable<Armadillo> GetList()
    {
        if(_Cache.TryGetValue(_CacheKey, out List<Armadillo> armadillos))
        {
            return armadillos;
        }
        else
        {
            List<Armadillo> armadillos = _ArmadilloRepo.GetList();
            _Cache.Set(_CacheKey, armadillos);
            return armadillos;
        }
    }
    /*Other methods omitted*/
}
```

If you were paying attention, this code should look problematic.  `CachingArmadilloRepository` both IS an `IArmadilloRepository`, and REQUIRES USAGE OF an `IArmadilloRepository`.  We'll resolve this when we're registering our services in the **dependency injection container**.

`Program.cs`
```csharp
services.AddScoped<IArmadilloRepository, SqlArmadilloRepository>();
services.Decorate<IArmadilloRepository, CachingArmadilloRepository>();
```
The `Decorate` registration changes the behavior so that if any other object requests an `IArmadilloRepository`, it will get a `CachingArmadilloRepository`, but when the `CachingArmadilloRepository` requests an `IArmadilloRepository`, it will get a `SqlArmadilloRepository`.

This allows us to build additional functionality on top of an existing object, without the need to modify its internal structure.  



## Lifetime of a decorator
The lifetime of decorator will always be the same as that of the item it decorates.  In the example, `SqlArmadilloRepository` has a **Scoped** lifetime, so  `CachingArmadilloRepository` also has a **Scoped** lifetime