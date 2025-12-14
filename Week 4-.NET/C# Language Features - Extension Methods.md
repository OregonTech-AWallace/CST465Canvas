# C# Language Features - Extension Methods
It's great that C# has so many built-in methods.  Strings, for example, have methods for .ToUpper(), .ToLower() to change the case, .Trim() to remove whitespace and a whole bunch of other useful utility methods.  We're programmers, however, so it's not enough.  What if we have a special purpose string method that we want to use a lot, like converting a string to Pig Latin.  

## Standard Solution
We could create a static function of a class and then call it to perform the conversion.
```csharp
public static class StringExtensions
{
    public static string ToPigLatin(string input)
    {
        string modifiedInput = input;
        //Implement conversion here.
        return modifiedInput;
    }
}
```
We could then call it like this:
```csharp
string normalString = "Make this sound funny";
string pigLatinString = StringExtensions.ToPigLatin(normalString);
```
Do we actually like this though? 
![Thumbs down](../Images/4/thumbs-down.gif)
## The More Elegant Way
The problem mentioned before is exactly what **extension methods** exist for.  Let's modify the code above slightly
```csharp
public static class StringExtensions
{
    public static string ToPigLatin(this string input)
    {
        string modifiedInput = input;
        //Implement conversion here.
        return modifiedInput;
    }
}
```
Notice that we changed the parameter of the function ToPigLatin from `string input` to `this string input`.  This convention is picked up 

### Requirements
- The class containing the method must be static
- The method itself must be static
- The first parameter of the method must use the `this` keyword followed by the type of object the method will apply to
- You must ensure the namespace containing the class is included anywhere you want to use the extension method

### Actual Implementation
```csharp
public static class StringExtensions
{
    public static string ToPigLatin(this string input)
    {
        if (string.IsNullOrWhiteSpace(input))
        {
            return input;
        }

        var words = input.Split(' ');
        var pigLatinWords = words.Select(word =>
        {
            var firstLetter = word[0];
            if ("aeiouAEIOU".Contains(firstLetter))
            {
                return word + "yay";
            }
            else
            {
                var restOfWord = word.Substring(1);
                return restOfWord + firstLetter + "ay";
            }
        });

        return string.Join(' ', pigLatinWords);
    }
}
```
And now the usage:
```csharp
string normalString = "Make this sound funny";
string pigLatinString = normalString.ToPigLatin();
```
IT'S BEAUTIFUL!  
![Man concealing tears of joy](../Images/4/beautiful.jpg)

## Limitations of Extension Methods
The most notable limitation of an extension method is that it still cannot access private variables/methods of the object they operate on.  This is because they are purely a syntactic construct that makes it look like they are a native method of a type.  They still ARE NOT a native method of the type.