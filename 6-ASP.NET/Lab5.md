# Lab 5 Working with Forms in ASP.NET
Access the code for the lab via GitHub Classroom. This is a trial run of GitHub Classroom functionality to see how well it works.   
[https://classroom.github.com/a/CD4ewXZm](https://classroom.github.com/a/CD4ewXZm)

I have provided you with a project that I would consider poorly created.  Your lab this week is to: 
- Convert Views to use a layout file
- Utilize _ViewStart.cshtml and _ViewImports.cshtml
- Convert HTML Helpers to Tag Helpers

## The Layout File
All of the views (.cshtml files) in the Views folder contain a lot of repetitive markup.  
- Extract the parts that are repeated for all views to /Views/Shared/_Layout.cshtml and add the @RenderBody() call in the appropriate place. Clean up all of the views so they now only contain the necessary markup.
- Set the Layout for all views in _ViewStart.cshtml

## The Registration Form

- Modify the Index.cshtml view for RegistrationForm to do things with ASP.NET Tag Helpers instead of the plain HTML and HTML Helpers that are currently in use. We didn't fully cover HTML Helpers, so here's a tip:
The replacement to the @Html.ValidationMessageFor() helper would be
    ```html
    <span asp-validation-for-""></span>
    ```

- As part of the tag helper replacement, there are many things that should be removed, for example id, name and for attributes, and text within the label elements

- Replace the "State" dropdown with a tag helper using the "StateList" property on the model.  You will use the asp-for and asp-items tag helpers on the `<select>` element to accomplish this.

- Turn on Client-Side Validation by including the following JavaScript libraries in the _Layout.cshtml file:
    ```html
    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>

    <!-- jQuery Validate library-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.js"></script>

    <!-- jQuery Validate unobtrusive validation library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validation-unobtrusive/3.2.12/jquery.validate.unobtrusive.js"></script>
    ```
- Use tag helpers to update the link in the view /Views/Home/Index.cshtml to referencce the Registration Form

## Additional Validation
In this section, we will be modifying `RegistrationFormModel.cs`.  Add annotations to the model to perform the following validations:
- Restrict the length of LastName to 40 characters
- The EmailAddress field is in the format of an email address  (HINT: don't write your own RegEx!)
- Validate that ZipCode is 5 numeric characters (HINT: You may want to write a RegEx here, or have ChatGPT help you if you're not familiar with RegEx)

## Error Handling

- Implement Error Handling to catch 404 and 500 errors.  Create a file in your controllers folder named `ErrorController.cs`.  Name the class in this file ErrorController.

- Add an Index action.  Remember to set up your route attributes so that this controller/action are accessible.  This can be done with syntax like [Route("")] or [HttpGet("")] depending on whether we need to support multiple request methods.

- Use the following to get the status code of the error: 
    ```csharp
    int statusCode = HttpContext.Response.StatusCode;
    ```
    You can pass this to the View() method.
- In Program.cs you will want to add the following, which should be registered before any of the other middleware.
    ```csharp
    if(!app.Environment.IsDevelopment())
    {
        //This will catch unhandled exceptions and generate a status code of 500
        app.UseExceptionHandler("/Error");
        //This will handle other status codes where an exception is not involved, such as 404
        app.UseStatusCodePagesWithReExecute("/Error");
    }
    ```
    In order for this code to work, you will need to edit Properties/launchSettings.json and change ASPNETCORE_ENVIRONMENT from "Development" to "Production"

- Try browsing to the following pages in the browser
    - /Home/Index2
    - /Home/Index3
    - /Home/Index4
    - /blah

    If everything is set up properly, the first one should give you a 500 error, the second should give you a 401 error, and the last two should give you 404 errors.

- Create two more views for handling status codes of type 500 (Internal Server Error) and 404 (Page not found).  In the Index action, it will return the view for these two error types, or just the Index view if it is any other status code.
Commit your changes and push to GitHub

