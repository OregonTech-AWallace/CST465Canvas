# CSS Frameworks
If you spend any time working in web development, you will assuredly hear the names of CSS frameworks mentioned.  For a long while Bootstrap was the main player in that arena.  Over the last few years, a new framework called Tailwind has been gaining massive popularity.  

## How do CSS Frameworks Work?

A CSS framework is a library of pre-written CSS selectors that you can apply to your HTML in order to get the desired look and feel.  Rather than having to write every single CSS property declaration yourself, you can instead add classes to get the desired outcome.

They will typically include:
- **Default Style Overrides** - CSS Frameworks will typically override certain elements of the default browser stylesheet.  One common override is changing the box-sizing: content-box; property to box-sizing: border-box; to mitigate box sizing issues in complex layouts
- **Utility Classes** - CSS Frameworks provide pre-written classes that you can apply to HTML elements in your pages.  These utility classes may be as simple as setting the margin, or as complex as creating flexbox layouts that vary at different screen resolutions. 
- **Components** - Some CSS Frameworks provide prestyled components.  While these are still applied to elements as classes, these are distinguished from utility classes in that instead of providing a single purpose, they often require specifically structured nested elements with classes and will create a whole visual style, such as creating modal popups, dropdown menus or tabbed navigation.

## Common Frameworks
### Bootstrap
Bootstrap was created by Twitter (now X) in 2010 and was later released to the public. It became wildly popular as it made it very easy for anyone with a tiny bit of CSS experience to create beautiful and responsive websites.  Bootstrap, while having a number of utility classes, is focused around the idea of utilizing their pre-built components. While this provides a ton of functionality out-of-the-box, it also has the side-effect of making almost all websites built with Bootstrap look/feel the same.

### Tailwind
Tailwind CSS was released in 2019 and has found massive popularity since then.  Unlike Bootstrap which has a large focus on pre-built components, Tailwind CSS provides a large array of utility classes and turns you loose to build your own things.  It also has methods for optimizing your CSS files so that only the items you use are in the production build of your CSS file, resulting in a much smaller footprint.