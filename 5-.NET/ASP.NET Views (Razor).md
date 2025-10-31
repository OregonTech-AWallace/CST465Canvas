# ASP.NET Views (Razor).md

Razor is a templating engine used in ASP.NET to create dynamic web pages. It allows you to embed server-side code into HTML and provides HTML-like syntax for building forms and accessing routing information.

## The `@model` Directive

The `@model` directive is used to specify the type of data that the view expects. This directive makes the data available to the view through the `Model` variable.

Example:
```csharp
@model MyApp.Models.Product

<h1>Product Details</h1>
<p>Name: @Model.Name</p>
<p>Price: @Model.Price</p>
```
In this example:
- The `@model` directive declares that the view expects a `Product` object.
- The `Model` variable is used to access the properties of the `Product` object.

## The **@** Symbol

The **@** symbol is used to inject C# code into the Razor view. It can be used for:
### Inline expressions
```html
<p>Today's date: @DateTime.Now.ToShortDateString()</p>
```
Inline expressions may also be enclosed within parenthesis in order to allow for more complex expressions:
```html
<p>Is September?: @(DateTime.Now.Month == 9 ? "Yes!" : "No") </p>
```
### Code blocks
```csharp
@{
    var message = "Welcome to Razor!";
}
<p>@message</p>
```
Code blocks can also contain functions, although this should usually be avoided:
```csharp
@{
    string ShortenRobert(string name)
    {
        if(name == "Robert")
        {
            name = "Bob";
        }
        return name;
    } 
}
<p>Name: @ShortenRobert("Robert")</p>
```
### Control structures:
```csharp
@if (Model.IsAvailable)
{
    <p>The product is available.</p>
}
else
{
    <p>The product is out of stock.</p>
}
```


### Full View Example
Sticking with our Armadillo example, here is a full view that would output the properties of our Armadillo:
```html
@model CST465.Armadillo
@{
    string GetRotundnessDescription(int value)
    {
        return value switch
        {
            1 => "Not Rotund",
            2 => "Slightly Rotund",
            3 => "Moderately Rotund",
            4 => "Very Rotund",
            5 => "Extremely Rotund",
            _ => "Chonky"
        };
    }
}

<!DOCTYPE html>
<html lang="en-us">
    <head>
        <title>Armadillo</title>
    </head>
    <body>
        <h1>Armadillo</h1>
        <div>Name: @Model.Name</div>
        @if(Model.Rotundness < 1)
        {
            <div>This armadillo wasted away to nothing</div>
        }
        else
        {
            <div>Rotundness: @GetRotundnessDescription(Model.Rotundness)</div>
        }
        
    </body>
</html>
```