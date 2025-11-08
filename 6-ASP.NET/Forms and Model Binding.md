# ASP.NET Forms and Model Binding
Let's look at how ASP.NET processes form submissions.  We'll start with a very basic form example using plain HTML.  

Let's show that definition of an armadillo again:
`Models/Armadillo.cs`
```csharp
public class Armadillo
{
    public string Name{get;set;}
    public int Rotundness {get;set;}
}
```

Here is a controller that is ready to create a new armadillo:
```csharp
[Route("armadillo")]
public class ArmadilloController : Controller
{
    [HttpGet("new")]
    public IActionResult New()
    {
        return View();
    }

    [HttpPost("new")]
    public IActionResult New(Armadillo model)
    {
        //The armadillo has been posted.  We will pass it to a view and display the posted data
        return View("DisplayArmadillo", model);
    }
}
```

I'm going to go ahead and assume that a layout page is being used to omit unnecessary markup

`/Views/Armadillo/New.cshtml`
```html
<form action="/armadillo/new" method="POST">
    <div>
        <label for="Name">Name</label>
        <input type="text" id="Name" name="Name">
    </div>
    <div>
        <label for="Rotundness">Rotundness</label>
        <input type="text" id="Rotundness" name="Rotundness">
    </div>
    <button type="submit">Save</button>
</form>
```
`/Views/Armadillo/DisplayArmadillo.cshtml`
```html
@model Armadillo

<h1>Armadillo Details</h1>
<p>Name: @Model.Name</p>
<p>Rotundness: @Model.Rotundness</p>
```

The previous code works to render a form, which will then post the data back to the `New` action on the controller.  The server knows how to convert that data into an object of type `Armadillo`, **but HOW?!**  
## Model Binding
**Model binding** is a practice performed automatically by ASP.NET controllers.  It looks at the names of the items being posted to the form, then looks at the object for the parameter accepted by the controller action, and maps fields to the object based on the form field names.  

## HTML Helpers
If all of our needs could accommodated by HTML and CSS, there would be no need for newfangled technologies like ASP.NET.  HTML helpers were introduced in Razor as the first mechanism for automatically rendering dynamic fields for models. They made it easier to add compile time checking to ensure that our form fields would properly match up to server actions.

Let's rewrite the form for creating a new armadillo with HTML Helpers
`Views/Armadillo/New.cshtml`
```csharp
@model Armadillo

@Html.BeginForm("New", "Armadillo", FormMethod.Post)
{
 <div>
    @Html.LabelFor(m => m.Name)
    @Html.TextboxFor(m => m.Name)
 </div>
 <div>
    @Html.LabelFor(m => m.Rotundness)
    @Html.TextboxFor(m => m.Rotundness)
 </div>   
 <button type="submit">Save</button>
}
```
**Items of interest:**

- **@Html.Beginform("New", "Armadillo", FormMethod.Post)**  
This defines a form block which will perform a POST to the New action of the Armadillo controller.  

- **@Html.LabelFor(m => m.Name)**  
This is responsible for rendering a label element.  It knows how to set the "for" attribute appropriately because it is bound to the appropriate model property with the lambda expression m => m.Name, which is shorthand for a function that takes the input m and returns m.Name.  The Model is implicitly passed to this function

- **@Html.TextboxFor(m => m.Name)**  
This works just lake the label, except it renders a textbox instead of a label

You probably noticed that HTML Helpers feel very disjointed from the rest of the HTML.  Microsoft noticed that as well, which is why they are superceded by a technology known as Tag Helpers.  I am including HTML Helpers for familiarity since they are not deprecated and you may still encounter them in the wild.


## Tag Helpers
Tag Helpers are the modern way to build dynamic forms with Razor.  They are much closer to regular HTML, but introduce some attributes that cause the tag to be processed by the server.

### Parsing of Tag Helpers
In order for **tag helpers** to be appropriately parsed, we must include a directive to our view.  Rather than adding it to each view, however, we should use our _ViewImports.cshtml file:

`/Views/_ViewImports.cshtml`
```html
@addTagHelper *, Microsoft.AspNetCore.Mvc.TagHelpers
```
This line tells it to add all tag helpers from the namespace Microsoft.AspNetCore.Mvc.TagHelpers.  It is even possible for us to create our own tag helpers, but we will not have time to cover that.  

Now, let's create our form for a third time, but using tag helpers this time:

`Views/Armadillo/New.cshtml`
```csharp
<form asp-action="New" asp-controller="Armadillo" method="POST">
    <div>
        <label asp-for="Name"></label>
        <input type="text" asp-for="Name">
    </div>
    <div>
        <label asp-for="Rotundness"></label>
        <input type="text" asp-for="Rotundness">
    </div>
    <button type="submit">Save</button>
</form>
```
**Items of interest:**
- **asp-\* attributes** - These attributes are the "tag helpers".  They add dynamic functionality to existing tags
    - asp-action and asp-controller are used together.  The benefit is that we could change the route definitions on our controller without changing the view code and it will dynamically update the action attribute of the form
    - asp-for - specifies the property of the views Model which the element is associated with

