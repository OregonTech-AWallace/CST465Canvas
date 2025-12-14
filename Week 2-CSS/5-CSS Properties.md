# CSS Property Units
## CSS Box Model Shorthand
The reading did a decent job of explaining the box model, but it was missing a little when it comes to describing the different shorthand available for padding, border, and margin.

For each of these units, we can specify the side to apply the width explicitly:
```css
padding-top: 5px;
padding-right: 5px;
padding-bottom: 5px;
padding-left: 5px;

margin-top: 5px;
margin-right: 5px;
margin-bottom: 5px;
margin-left: 5px;

border-top-width: 5px;
border-right-width: 5px;
border-bottom-width: 5px;
border-left-width: 5px;

```
This is very verbose, so in cases where the units are the same, we can write this more succinctly:
```css
padding: 5px;

margin: 5px;

border-width: 5px;
```
But wait, there's more! We can specify varying units in a single statement.
```css
/* Order is top, right, bottom, left */
padding: 5px 10px 5px 10px;

/* Those values above repeat, we can write it shorter. */
/* Order is top/bottom, right/left */
padding: 5px 10px;

/* and now, let's make it weird */
/* Order is top, left/right, bottom */
padding: 5px 10px 7px;
/* top is 5px, left and right are 10px, bottom is 7px
```

## Units of Size
**px** - Pixels, each one is a single dot on the screen  
**em** - 1em is equal to the font size of the parent container  
**rem** - 1rem is equal to the font size of the html element  
**%** - Percentage, relative to the parent container.  

*Fun Fact:* "em" is the phonetic for the letter "M".  Originally, this unit referred to the width of the "M" in whatever the current font was.  Now it is relative to the defined font size.

**When writing CSS, there is no need to write a unit if the value is 0.**  0 is the same across all units, so specifying a unit would be superfluous and waste precious network bytes when the CSS file is transferred.

## Colors

There are three main ways of specifying colors in CSS:
### **By Name**  
There are many color names recognized by CSS, such as red, blue, green, yellow, etc.  
Example:  
```css
color: red;
```
### By RGB Hex Value  
Each color component is represented by two hex digits.  It takes the form of a hashtag followed by six hex values.
Example:
```css
color: #ff0000;
```
### By RGB Decimal Values
Each color component is represented by a decimal value from 0 to 255
Example:
```css
color: rgb(255, 0, 0);j
```

Options 2 and 3 also support a 4th digit for the alpha value which controls opacity.  There are also less commonly used ways. These items are outside the scope of this class.


### Color Shorthand
In cases where each RGB value in a color should be repeated, it can be represented as only 3 digits.  
Example:
```css
color: #f00; /* This is equivalent to #ff0000 */
color: #c5f; /* This is equivalent to #cc55ff */
```

