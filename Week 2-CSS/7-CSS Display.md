# CSS Display Properties

If you thought a block element was a block element and an inline element was an inline element, you're only partially right.  Semantically, the rules for what elements can contain certain other elements still apply, but when it comes to rendering them, all that can go out the window.  The `display` property in CSS is used to define how an element is displayed on the page. Below are the most common values for the `display` property and their descriptions:

## `block`
- The element is displayed as a block-level element.

## `inline`
- The element is displayed as an inline element.

## `inline-block`
- The element is displayed as an inline-block element, like an image.
- BE WARNED, there are side effects to using inline-block and you should usually avoid it

## `none`
- The element is not displayed and does not take up any space in the layout.

## Special Display Values
## `flex`
- Enables a flexible box layout.
- Used to align and distribute space among items in a container.
- This is an incredibly useful display mode for creating page layouts.  
Example: `display: flex;`.

There is a great guide at: https://css-tricks.com/snippets/css/a-guide-to-flexbox/

## `grid`
- Enables a grid-based layout.
- Allows for two-dimensional layout (rows and columns).  
- This is also a useful display mode, although flexbox typically gets more use.  
Example: `display: grid;`.

There is a great guide at: https://css-tricks.com/snippets/css/complete-guide-grid/

### Example Usage
```css
/* Make a block element display as an inline element */
div {
    display: inline;
}

/* Make an inline element display as a block element */
span {
    display: block;
}

/* Flex container */
.myFlexibleContainer {
    display: flex;
}
```

Choose the appropriate `display` value based on the layout and behavior you want for your elements.