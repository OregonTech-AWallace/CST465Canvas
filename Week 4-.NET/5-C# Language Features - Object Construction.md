# C# Language Features - Object Construction

## Primary Constructors
Here is a classic constructor example in C#:
```C#
public class Student
{
    public Student(string firstName, string lastName)
    {
        _FirstName = firstName;
        _LastName = lastName;
    }
    public string GetName()
    {
        return $"{_FirstName} {_LastName}";
    }
    private string _FirstName {get;set;}
    private string _LastName {get;set;}
}
```
This can now be simplified by using a Primary Constructor pattern:
```C#
public class Student(string firstName, string lastName)
{
    public string GetName()
    {
        return $"{firstName} {lastName}";
    }
    
}
```
Notice how in the second example firstName and lastName are directly accessible in the member function GetName().  They are, in fact, accessible inside the entire class definition.  There are some caveats to using primary constructors, however.

### Primary Constructors and the `: this` Syntax

In the classic constructor pattern, you could use the `: this` syntax to chain constructors. For example:

```C#
public class Student
{
    public Student(string firstName, string lastName)
    {
        _FirstName = firstName;
        _LastName = lastName;
    }

    public Student(string fullName) : this(fullName.Split(' ')[0], fullName.Split(' ')[1])
    {
    }

    public string GetName()
    {
        return $"{_FirstName} {_LastName}";
    }

    private string _FirstName { get; set; }
    private string _LastName { get; set; }
}
```

However, with the Primary Constructor pattern, the `: this` syntax is no longer valid. Instead, an additional constructor would need o again use accessor variables for the two to share the same definitions.

```C#
public class Student(string firstName, string lastName)
{
    //We must go back to having accessor variables, and set their defaults based on the primary constructor
    private string _FirstName { get; set; } = firstName;
    private string _LastName { get; set; } = lastName;

    public Student(string fullName) 
    {
        _FirstName = fullName.Split(' ')[0];
        _LastName = fullName.Split(' ')[1];
    }

    public string GetName()
    {
        return $"{_FirstName} {_LastName}";
    }
}
```

## Implicit Object Creation Expressions
There are enhancements to the way we instantiate classes also.  The following three statements are equivalent:

```C#
//Fully Explicit Definition
Student student = new Student("Hootie", "Owl");
```
```C#
//Implicit variable, Explicit construction
var student = new Student("Hootie", "Owl");
```
```C#
//Explicit variable, implicit construction
Student student = new("Hootie","Owl");
```