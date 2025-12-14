
# Model Annotations and Validation for View Models

ASP.NET Data Annotations are attributes that can be applied to model classes and their properties to provide metadata about the data. They serve multiple purposes including validation, display formatting, and database schema generation.

## How Data Annotations Work

Data annotations work by decorating your model properties with specific attributes that the ASP.NET framework interprets at runtime. These attributes provide instructions to various components of the framework.

## Common Data Annotations
The built in data annotations, you will need to include a namespace at the top of your model files (or define it globally):
```csharp
using System.ComponentModel.DataAnnotations;
```

### Validation Attributes

```csharp
[Required(ErrorMessage = "Name is required")]
public string Name { get; set; }

[Range(1, 100, ErrorMessage = "Age must be between 1 and 100")]
public int Age { get; set; }

[StringLength(50, MinimumLength = 2)]
public string Title { get; set; }

[EmailAddress]
public string Email { get; set; }
```

### Display Attributes
- `[Display]` controls how properties appear in UI
- `[DataType]` provides semantic information for rendering
- `[DisplayFormat]` handles date/time and numeric formatting

```csharp
[Display(Name = "Full Name", Description = "Enter your complete name")]
public string FullName { get; set; }

[DataType(DataType.Password)]
public string Password { get; set; }

[DisplayFormat(DataFormatString = "{0:C}")]
public decimal Price { get; set; }
```

## Benefits

1. **Centralized Validation Logic** - Rules are defined once in the model
2. **Automatic UI Generation** - Scaffolding uses annotations for form generation
3. **Client-Side Validation** - JavaScript validation generated automatically

5. **Consistency** - Same rules apply across the entire application

## Validation in Action
Data annotations integrate seamlessly with ASP.NET MVC:
- Model binding respects validation attributes
- Razor views automatically generate validation messages
- HTML Helpers and Tag Helpers use display attributes for labels
- Validation occurs before controller actions execute


```csharp
public class ArmadilloModel
{
    [Required(ErrorMessage="Name is required")]
    [Display(Name="Name")]
    public string Name {get;set;}

    [Required(ErrorMessage="Rotundness is required")]
    [Display(Name="From 1-10, How Rotund is the Armadillo?")]
    [Range(1, 10, ErrorMessage="Rotundness must be between 1 and 10")]
    public int? Rotundness{get;set;}
}
```
```html
<form asp-action="New" asp-controller="Armadillo" method="POST">
    <div>
        <label asp-for="Name"></label>
        <input asp-for="Name" />
        <span asp-validation-for="Name"></span>
    </div>
    <div>
        <label asp-for="Rotundness"></label>
        <input asp-for="Rotundness" />
        <span asp-validation-for="Rotundness"></span>
    </div>
    <button type="submit">Save</button>
</form>
```

## Checking Validation on the Server Side
```csharp
[Route("armadillo")]
public class ArmadilloController : Controller
{
    [HttpPost("new")]
    public IActionResult New(ArmadilloModel model)
    {
        //The following line checks whether the model passes validation
        if(!ModelState.IsValid)
        {
            //Send the user back if it fails.  
            // Additional data is passed back about the validation result
            return View(model);
        }
        return View("DisplayArmadillo");
    }
}
```

## Adding Client-side Validation
If you were to test the code up to this point, you may notice a flicker of the screen every time you hit the submit button.  This is because each time the submit button is clicked, it is sending the data to the server for validation.  ASP.NET stores enough information in the browser to perform this validation locally, however.  While we should always still perform server-side validation, it is also good user experience, and better for reducing network traffic, to also perform validation on the client side.  To do this, we will need to include some JavaScript code

The following code is Microsoft's recommended way of turning on client-side validation.  It can be added to the _Layout.cshtml file.
```html
<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>

<!-- jQuery Validate library-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.js"></script>

<!-- jQuery Validate unobtrusive validation library -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validation-unobtrusive/3.2.12/jquery.validate.unobtrusive.js"></script>
```
While this works great, it includes a lot of unnecessary JavaScript as well.  

For those interested, another, lighter weight, library has been created by Phil Haack to accomplish the same purpose.  You can find more information at: https://github.com/haacked/aspnet-client-validation/