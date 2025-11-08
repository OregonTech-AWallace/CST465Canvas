# _ViewStart.cshtml and _ViewImports.cshtml
 What if every(or almost every) view will be using the same layout page?  It will still get repetitive and annoying to have to add that code block to every view, however.
These two special files help further ease some of the repetitive view-related code we have to write.

## _ViewStart.cshtml
Executes before each view is rendered, providing a centralized location for view-level setup.

**Common Usage**: 
- Set the default layout for all views 
```html
@{
    Layout = "_Layout";
}
```
- Initialize common view data or variables
- Execute shared initialization logic across multiple views


## _ViewImports.cshtml
Imports namespaces, tag helpers, and other directives that are commonly used across views. 
**Common Usage**:
- Import namespaces 
```html
@using MyApp.Models
```
- Add tag helpers (more on this later)
```html
@addTagHelper *, Microsoft.AspNetCore.Mvc.TagHelpers
```
- Inject services (more on this later)
```html
@inject IMyService MyService
```

