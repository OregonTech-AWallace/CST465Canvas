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

## The `@` Symbol

The `@` symbol is used to inject C# code into the Razor view. It can be used for:
### **Inline expressions**
```html
<p>Today's date: @DateTime.Now.ToShortDateString()</p>
```
### **Code blocks**
```csharp
@{
    var message = "Welcome to Razor!";
}
<p>@message</p>
    ```
### **Control structures**:
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

