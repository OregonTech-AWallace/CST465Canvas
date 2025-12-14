# C# Language Features - String Formatting

## String Interpolation
Definition from Wikipedia:
```
In computer programming, string interpolation (or variable interpolation, variable substitution, or variable expansion) is the process of evaluating a string literal containing one or more placeholders, yielding a result in which the placeholders are replaced with their corresponding values.
```
In C#, you could concatenate values into a string like this:
```csharp
string firstName = "George";
string lastName = "Smith";
string welcomeMessage = "ATTENTION" + firstName + " " + lastName + ". Your vehicle's extended warranty is about to expire!";
```
The more values you need to add, the more complex and difficult to maintain it gets, however.  Let's rewrite this with **string interpolation**.
```csharp
string firstName = "George";
string lastName = "Smith";
string welcomeMessage = "ATTENTION {firstName} {lastName}. Your vehicle's extended warranty is about to expire!";
```
Notice that the string welcome message starts with a dollar sign '$'.  This symbol is what tells the compiler that the string following it will potentially contain replacement expressions.  

 I think you'll agree that string interpolation is a much more elegant solution.

## Raw String Literals
This is how multiline strings were done in the past in C#:
```csharp
string multiline = @"This
can span
multiple lines";
```
The downside is that it is still inflexible.  It does not support interpolation, and it does not allow you to embed quotes because any quote would be seen as an end of the string. There's a new hero in town:
```csharp
string multiline = """
This
can span
multiple lines
""";
```