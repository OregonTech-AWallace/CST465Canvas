# CSS Custom Properties (Variables)

CSS Custom Properties are easiest to think of as variables.  They allow you to store values that can be reused throughout your stylesheet. They make it easier to maintain and update styles, especially for colors, spacing, fonts, and other commonly used values.  Custom Properties were not introduced in the CSS specification until after 2012 and did not gain widespread browser support until 2017. 

## Declaring CSS Variables

CSS variables are declared within a selector using the `--` prefix:

```css
:root {
    --main-bg-color: #f5f5f5;
    --primary-color: #3498db;
    --padding: 16px;
}
```

- `:root` is commonly used to define global variables.

## Using CSS Variables

To use a variable, reference it with the `var()` function:

```css
body {
    background-color: var(--main-bg-color);
    color: var(--primary-color);
    padding: var(--padding);
}
```

## Benefits

- **Maintainability:** Update a value in one place to affect multiple rules.
- **Theming:** Easily switch themes by changing variable values.
- **Inheritance:** Variables can be scoped to elements for context-specific styling.

## Locally Scoped Properties
While global usage is most common, custom properties can be scoped to any selector
## Example

```css


div {
    --gap: 10px;
    padding-left: var(--gap);
    margin-left: var(--gap);
}
```



## Resources

- [MDN Web Docs: CSS Variables](https://developer.mozilla.org/en-US/docs/Web/CSS/--*)
- [CSS Tricks: A Complete Guide to Custom Properties](https://css-tricks.com/a-complete-guide-to-custom-properties/)