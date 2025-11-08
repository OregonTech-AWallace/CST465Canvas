# Layout Files
Last week, we looked at a simple view  with content like this:
`Armadillo.cshtml`
```html
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
It would be a HUGE burden if we had to define all of our basic HTML tags every time we created a view.  It would also make the site a maintenance nightmare when we had to add something new to all pages.  

## Layout Pages to the Rescue
Layout pages are one of the primary mechanisms provided by ASP.NET allowing for HTML content reuse. The recommended location to place layout files is in `/Views/Shared`.  This path is one of the default locations that ASP.NET searches to find View files.

 Here's an example:
`/Views/Shared/_Layout.cshtml`
```html
<!DOCTYPE html>
<html lang="en-us">
    <head>
        <title>ViewBag.Title</title>
    </head>
    <body>
        <h1>ViewBag.Title</h1>
        <main>
        @RenderBody()
        </main>
    </body>
</html>
```
**Important things to note in this snippet:**

- **The Filename** - The file begins with an '_'.  Files that do not represent the main part of a view, such as layouts and partial views should start with an '_'.  This is not a necessity, just a convention to make the project files easier to understand.

- **ViewBag.Title Usage** - The ViewBag, which can be populated from a controller action, is also accessible from a layout page. The page title is a field that will vary between views, and but it feels out of place to have to send it in every model. This is a **very** common use case for the ViewBag.  

- **@RenderBody()** - When a view is being rendered, this directive tells the controller where to inject the content from the view into the layout.

## Using the Layout Page
`Armadillo.cshtml`
```html
@{
    Layout = "_Layout";
    //This is equivalent to:
    //Layout = "Views/Shared/_Layout.cshtml";
}
<div>Name: @Model.Name</div>
@if(Model.Rotundness < 1)
{
    <div>This armadillo wasted away to nothing</div>
}
else
{
    <div>Rotundness: @GetRotundnessDescription(Model.Rotundness)</div>
}
```
This is great!  We now can update the layout for the page in one place. 
## Sections
`RenderBody()` can handle the largest need for putting view content into the template.  We're programmers, though.  We have LOTS of needs, and always run into situations to push beyond the basics.  Sections allow us to render content from views into other portions of the layout page as well.  Let's expand our example:

`/Views/Shared/_Layout.cshtml`
```html
<!DOCTYPE html>
<html lang="en-us">
    <head>
        <title>ViewBag.Title</title>
        @RenderSection("Head", required: false)
    </head>
    <body>
        <h1>ViewBag.Title</h1>
        <main>
        @RenderBody()
        </main>
        @RenderSection("Scripts", required: false)    
    </body>
</html>
```
**Important things to note in this snippet:**
- **@RenderSection("Scripts", required:false)**
    - The first parameter is a name to use when referencing the section in a view
    - The second parameter is whether or not an error will be thrown at runtime if the view **does not** define the named section
    -This demonstrates a syntax for a function call in C# that explicitly names a parameter. 

And now, the view:

`Armadillo.cshtml`
```html
@{
    Layout = "_Layout";
    //This is equivalent to:
    //Layout = "Views/Shared/_Layout.cshtml";
}
<div>Name: @Model.Name</div>
@if(Model.Rotundness < 1)
{
    <div>This armadillo wasted away to nothing</div>
}
else
{
    <div>Rotundness: @GetRotundnessDescription(Model.Rotundness)</div>
}

@section Head{
    <link rel="stylesheet" type="text/css" href="ArmadilloStyle.css">
}

@* We don't have to define Scripts because it is not required *@
```


