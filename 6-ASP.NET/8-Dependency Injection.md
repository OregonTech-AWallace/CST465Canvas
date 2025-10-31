# Dependency Injection
ASP.NET utilizes **dependency injection** as foundational component of building ASP.NET applications.

## Key Terms
**Inversion of Control (IoC)** – A programming methodology where objects are given information about other objects without having to create or control them

**Dependency Injection (DI)** – A design pattern that implements IoC for resolving dependencies.  Usually this occurs by means of the constructor, but can also be done via a setter or a property

**Dependency Injection Container** – An object that stores the mappings of interface types to concrete types and resolves/instantiates them at runtime

## Explanation
Let's explore this concept the same way we've explored several other concepts to this point, using armadillos.  We will move beyond just a simple fascination with them and start building a farm.
```csharp
public class Farm
{
    public string Buy(Armadillo armadillo)
    {

    }
    public string Sell(int )
    private List<Armadillo> _FarmAnimals = new ();

}
```
## Adding Sevices
