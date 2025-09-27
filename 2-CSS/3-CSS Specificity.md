## CSS Selector Specificity

CSS selector specificity determines which styles are applied to an element when multiple rules could match. Specificity is calculated based on the types of selectors used:

- **Inline styles** (e.g., `style="..."`) have the highest specificity.
- **ID selectors** (e.g., `#header`) are more specific than class selectors.
- **Class selectors**, **attribute selectors**, and **pseudo-classes** (e.g., `.menu`, `[type="text"]`, `:hover`) have medium specificity.
- **Element selectors** and **pseudo-elements** (e.g., `div`, `p`, `::before`) have the lowest specificity.

Specificity is usually represented as a four-part value: `a,b,c,d`:
- `a`: Inline styles
- `b`: Number of ID selectors
- `c`: Number of class, attribute, and pseudo-class selectors
- `d`: Number of element and pseudo-element selectors

When multiple rules apply, the one with the highest specificity wins. If specificity is equal, the last rule in the CSS is used.