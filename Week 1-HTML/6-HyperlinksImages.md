# Hyperlinks and Images
## The Anchor Element `<a>`

### Attributes
**href:** the page to load  
**name:** creates a "bookmark" within a page  
**target:** specifies the frame in which to open a page  
Example:  
`<a href="https://www.oit.edu">Go Owls!</a>`  

`<a>` Can also be used to create a link that will open the default email application on the client’s system like this:  
`<a href="mailto:alan.wallace@oit.edu">Email the Instructor</a>`  
Remember that if you are developing on a UNIX server, the filename link may be case sensitive.



## Absolute vs Relative Links
- An **absolute link** specifies a full URL including the http://.  
`<a href="https://www.oit.edu/admissions">Oregon Tech Admissions</a>`
- A **relative link** specifies the page to be loaded relative to the page that has the `<a>` element. Can only be used to link to pages on the same system.  
`<a href="/admissions">Oregon Tech Admissions</a>`

A word of warning: If your web site’s directory structure changes, you can break your relative links.

## Linking Within a Page
The anchor element has another use, and that is defining named locations on a page.  This allows for links to jump to a specific location on the same page, or even to a specific location on a different page.  
### Defining a Location on a Page
```html
<h2><a name="About">About</a></h2>
```
### Linking to a Named Location
On the same page:
```html
<a href="#About">View information about Oregon Tech</a>
```
On a different page:
```html
<a href="/some-page.html#About">View information about Oregon Tech</a>
```



## The Image Element `<img>`
### Required Attributes

**src:** the URL of the image
**alt:** text that appears if the image can’t be displayed
### Other Attributes
**height:** sets the height of the image  
**width:** the width of the image  
**ismap:** image is a server-side image map  
**longdesc:** URL of the document that   provides a long description
**usemap:** client-side image map

## Image File Formats with Built-in Support
**ICO:** Icon file, used for images in the browser tab   
**GIF:** Graphics Interchange Format  
**JPEG:** Joint Photographic Experts Group  
**PNG:** Portable Network Graphics  
**SVG:** Scalable Vector Graphics  