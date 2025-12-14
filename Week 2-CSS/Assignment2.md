I have provided an HTML document, the start of a CSS file, and some image mockups of how the page should look.  It will be your job to write the CSS to make the site look like it is supposed to.  You may change any of the background colors as you desire so long as the page is still easily readable. I have left for you all of the selectors that I used when building this, although you are free to modify the CSS file however you see fit.

Part 0: Setup
Create a new folder in your repository named Assignment2

Mockup 1Download Mockup 1

Mockup 2Download Mockup 2

Assignment FilesDownload Assignment Files

**DO NOT MODIFY THE HTML DOCUMENT**

## Part 1: Top Navigation Dropdown Menu

The top navigation menu should use flexbox to arrange the top level items.  It is not a mistake that the items are in backwards order in the HTML.  You will fix that with one of the CSS "flex-" properties

You will need to use a combination of "position: relative;" and "position: absolute;" for the dropdown menus. Some other properties you may need to investigate (although you don't need to use all of them) are "top", "right", "bottom", "left", "text-align"

If you notice that your menus are going behind other elements on the page, you will want to check out the "z-index" CSS property also.

## Part 2: The Grid

The element with ID "mainGrid" should use "display:grid;".  You will want to look at using the following CSS properties to get items to display where you want them.

### For the container:

grid-template-columns
grid-template-rows

### For the items:

grid-column-start
grid-column-end
grid-row-start
grid-row-end

## Part 3: Featured Items

The "featured" section of the grid will be implemented using flexbox also.  Some properties you will want to investigate to complete this are:

flex-wrap
justify-content
flex-grow
flex-shrink
flex-basis

### For the images:
object-fit 
max-width
height

## Part 4: The Banner Ad

Just as banner ads are insidious in the way they try to draw attention and get you to click on things you don't really want to, the rendered version of the element with ID "bannerad" in the mockup is insidious in the sense that there are things visible in the mockup that are not visible in the HTML.  This is because you will add these items via CSS.  CSS properties you will want to investigate to complete this are:

background-image
background-color
background-repeat
background-size
border-radius
content

## Part 5: The News Section

Let's end this on an easy note.  There is only one new CSS property to review for this:

background: linear-gradient(/*look up the options for this yourself*/);