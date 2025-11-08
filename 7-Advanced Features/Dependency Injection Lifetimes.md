# Dependency Injection Lifetimes

In the previous examples, we registered items with the DI container with this line:
```csharp
builder.Services.AddTransient<IFarm, ArmadilloFarm>();
```
`AddTransient()` probably feels like a pretty foreign method name right now, but it has to do with when the objects of the specified interface will be instantiated.

## Transient

With a transient liftime, a new instance is created every time a constructor taking part in dependency injection needs an IFarm. Transient lifetime is generally preferred for most purposes because the programmer does not have to worry as much about thread safety.


```csharp
builder.Services.AddTransient<IFarm, ArmadilloFarm>();
```

## Scoped

With a scoped lifetime, a new instance is created the first time per web request that a constructor taking part in dependency injection needs an IFarm, and that instance is reused only within the scope of that web request. Database contexts will commonly use a scoped lifetime so that the same database connection can be reused across an entire request.

```csharp
builder.Services.AddScoped<IFarm, ArmadilloFarm>();
```
## Singleton

With a singleton lifetime, a new instance is created the first time a constructor taking part in dependency injection needs an IFarm, and that instance is reused for the entire lifetime of the application. Examples of Singleton usage include configuration management and cache management where the same state needs to be accessible to the entire application without frequent reloading from disk. Extra care must be taken with

```csharp
builder.Services.AddSingleton<IFarm, ArmadilloFarm>();
```