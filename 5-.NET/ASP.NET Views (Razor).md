# ASP.NET Views (Razor).md
## Using Razor Templating in ASP.NET

Razor is a templating engine used in ASP.NET to create dynamic web pages. It allows you to embed server-side code into HTML using a simple and clean syntax.

### The `@model` Directive

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

### The `@` Symbol

The `@` symbol is used to inject C# code into the Razor view. It can be used for:
1. **Inline expressions**:
    ```html
    <p>Today's date: @DateTime.Now.ToShortDateString()</p>
    ```
2. **Code blocks**:
    ```csharp
    @{
         var message = "Welcome to Razor!";
    }
    <p>@message</p>
    ```
3. **Control structures**:
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

### Summary

Razor templating provides a powerful way to combine HTML and C# code. The `@model` directive and `Model` variable allow you to work with strongly-typed data, while the `@` symbol enables seamless integration of server-side logic into your views.
