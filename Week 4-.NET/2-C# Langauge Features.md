# C# Language Features - File Structure
As C# has evolved, many new features/constructs have been added.  We are going to look at a few of these as they can greatly streamline our use of the language.



## The OLD Program Entry Point
For years, this was easily recognizable as the program entry point for a C# console application. A lot has changed.  

**Program.cs**
```csharp
namespace MyApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World");
        }
    }
}
```
## File-scoped Namespace Declarations
Were any of you tired of having your entire file indented because of the namespace?  I know I was.  Now we can define the namespace at the top of the file, and the rest of the contents will be considered a part of that namespace.  Huzzah!

**Program.cs**
```csharp
namespace MyApp;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Hello World");
    }
}
```
![But wait, there's more!](../Images/4/TheresMore.jpg)
## Top-level Statements
This allows us to remove ALL boilerplate code for the program entry point.
### How does this work
- Only one file in the project is allowed to contain top-level statements (code outside of a class definition).
- Based on convention, this file should be called Program.cs, but it is not a requirement

**Program.cs**
```csharp
Console.WriteLine("Hello World");
```
Yep, that's it.  That is a fully-compilable C# program now, giving it the lean feel of many other popular languages.

## Global Using Statements
"using" statements in C# are used to include other namespaces into the file so that classes within them can be used without having to type the full path.  In the name of keeping things clean, we can now include "using" statements at a project level so that they are available in ALL files in your project.

**Defining in a code fie**
```csharp
global using System.Text.Json;
```
**Defining in the project(.csproj) file**
```xml
<Project Sdk="Microsoft.NET.Sdk">
  <ItemGroup>
    <Using Include="System.Text.Json" />
  </ItemGroup>
</Project>
```
