# Media Queries
Media queries are an advanced CSS construct which allows you to specify rules that only apply when certain conditions are met. 

## `min-width` and `max-width`
The min-width and max-width CSS properties are useful for responsive design.  They can allow a box to automatically shrink or grow, but stay within certain limits.  

They are also used in media queries to determine where breakpoints start/end.  


```css
label.standard{
    width: 100%;
}
#pageWrapper{
    width: 100%; /* Allow the width to be fluid to the window size */
    max-width: 1000px; /* Don't allow the width to grow larger than this */
}
@media screen and (min-width: 400px){
    /* Only apply when on screen and the width is 400px or larger, not when printed*/ 
    label.standard{
        width: 160px;
    }
}
```
Keep in mind that min-width/max-width are **inclusive** of the value specified for them, so `min-width: 400px` means *everything 400px and larger*, not *everything larger than 400px*.

You can also specify ranges like this:
```css
@media screen and (min-width: 400px) and (max-width:640px){
    /* Only apply when on screen and the width is 400px or larger, not when printed*/
    label.standard{
        width: 160px;
    }
}
```

## Device Types
Device type allow targeting of styles to specific devices.  This is commonly used to hide content that is not relevant on certain devices.

**all** – This media query applies to all media types
**screen** – This media query applies to screen  (computer, tablet, phone, etc.)
**print** – This media query is used for printers
**speech** – This media query is for screen readers that read the page out loud

A very common use case is to hide content when printing a page.  If someone is printing the content on your page, it is unlikely that they are wanting to print out your navigation menu also.  We can use a utility class like below and apply it to everything that we do not want sent to the printer if a user chooses to print the page.
```css
@media print{
    .noprint{
        display: none;
    }
}
```