# CSS Variables: Description and Usage

CSS variables, also known as custom properties, allow you to store values that can be reused throughout your stylesheet. They make it easier to maintain and update styles, especially for colors, spacing, fonts, and other design tokens.

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

## Example

```css
:root {
    --font-size: 18px;
    --text-color: #222;
}

h1 {
    font-size: var(--font-size);
    color: var(--text-color);
}
```

## Browser Support

CSS variables are supported in all modern browsers.

## Resources

- [MDN Web Docs: CSS Variables](https://developer.mozilla.org/en-US/docs/Web/CSS/--*)
- [CSS Tricks: A Complete Guide to Custom Properties](https://css-tricks.com/a-complete-guide-to-custom-properties/)