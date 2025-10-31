# Layout Files
Last week, we looked at a simple view  with content like this:

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
It would be a HUGE burden if we had to define all of our basic HTML tags every time we created a view.  It would also make the site a maintenance nightmare the second we have to add something new to all pages.  

## Layout Pages to the Rescue


## _ViewStart.cshtml and _ViewImports.cshtml