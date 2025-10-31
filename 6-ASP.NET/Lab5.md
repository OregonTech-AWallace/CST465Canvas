# Lab 5 Working with Forms in ASP.NET
Access the code for the lab via GitHub Classroom

I have provided you with a project that I would consider poorly created.  Your lab this week is to 
-Convert Views to use a layout file
-Utilize _ViewStart.cshtml and _ViewImports.cshtml
-Convert HTML Helpers to Tag Helpers

## The Registration Form

-Modify the Index.cshtml view for RegistrationForm to do things with ASP.NET Tag Helpers instead of the plain HTML and HTML Helpers that are currently in use. 

-As part of the tag helper replacement, there are many things that should be removed, for example id, name and for attributes, and text within the label elements

-Replace the "State" dropdown with a tag helper using the "StateList" property on the model.  You will use the asp-for and asp-items tag helpers on the <select> element to accomplish this.

-We didn't really cover HTML Helpers, so here's a couple tips.

---Anywhere you see @Html.<some method>, that is an HTML helper. 

---The replacement to the @Html.ValidationMessageFor() helper would be <span asp-validation-for-""></span>

-Turn on Client-Side Validation by including the following libraries in the _Layout.cshtml file:
```html
<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>

<!-- jQuery Validate library-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.js"></script>

<!-- jQuery Validate unobtrusive validation library -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validation-unobtrusive/3.2.12/jquery.validate.unobtrusive.js"></script>
```
Error Handling

-Implement Error Handling to catch 404 and 500 errors.  Create a file in your controllers file named "ErrorController.cs".  Name the class in this file ErrorController.

Add an Index action.  Remember to set up your [Route("")] attributes so that this controller/action are accessible.  

Use the following to get the status code of the error: 

int statusCode = HttpContext.Response.StatusCode;
You can pass this to the View() method.
In Program.cs you will want to add the following, which should be registered before any of the other middleware.

if(!app.Environment.IsDevelopment())
{
    //This will catch unhandled exceptions and generate a status code of 500
    app.UseExceptionHandler("/Error");
    //This will handle other status codes where an exception is not involved, such as 404
    app.UseStatusCodePagesWithReExecute("/Error");
}
In order for this code to work, you will need to edit Properties/launchSettings.json and change ASPNETCORE_ENVIRONMENT from "Development" to "Production"
Try browsing to the following pages in the browser
/Home/Index2
/Home/Index3
/Home/Index4
/blah
If everything is set up properly, the first one should give you a 500 error, the second should give you a 401 error, and the last two should give you 404 errors.
Now I want you to create two more views for handling status codes of type 500 (Internal Server Error) and 404 (Page not found).  In the Index action, it will return the view for these two error types, or just the Index view if it is any other status code.
Commit your changes and push to GitHub

-in the viewStart.cshtml reference the layout file
```
@{
    Layout = "_Layout";
}
```