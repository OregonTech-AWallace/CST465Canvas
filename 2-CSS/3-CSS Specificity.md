## CSS Selector Specificity

CSS selector specificity determines which styles are applied to an element when multiple rules could match. Specificity is calculated based on the types of selectors used:

**Inline styles** (e.g., `style="..."`) have the highest specificity, but should be avoided because they make styling very difficult to maintain.

We will focus primarily on the following:
- **ID selectors** (e.g., `#header`) are more specific than class selectors.
- **Class selectors**, **attribute selectors**, and **pseudo-classes** (e.g., `.menu`, `[type="text"]`, `:hover`) have medium specificity.
- **Element selectors** and **pseudo-elements** (e.g., `div`, `p`, `::before`) have the lowest specificity.

We will use the following HTML to demonstrate this concept for the next few examples
```html
<main id="pageContent">
    <nav class="mainNav">
        <ul class="navList">
            <li>One</li>
            <li>Two</li>
            <li>Three</li>
            <li>Four</li>
        </ul>
    </nav>
</main>
```
Let's examine this CSS selector:
```css
#pageContent nav .navList li {color: red;}
```
The table below represents the numbers of each type of selector
|ID Selectors |  Class/Attribute Selectors | Element Selectors |
|----|----|----|
|1|1|2| 

That example was pretty straight forward.  Now let's build a different selector for the same element
```css
main#pageContent nav.mainNav .navList li {color: blue;}
```

|ID Selectors |  Class/Attribute Selectors | Element Selectors |
|----|----|----|
|1|2|3| 

When multiple rules apply, the one with the highest specificity wins. If specificity is equal, the last rule in the CSS is used.

So if we applied both to a CSS file, what color would the text inside the list items be?
```css
#pageContent nav .navList li {color: red;}
main#pageContent nav.mainNav .navList li {color: blue;}
```

The text would be blue because it was a more specific selector.

## Overriding Selectors
What about the following selectors?  They are different selectors, but have the same level of specificity
```css
#pageContent nav .navList li {color: red;}
#pageContent nav.mainNav  li {color: blue;}
```

The text would still be blue.  Since they have the same level of specificity, the selector that appears last wins.


It is not uncommon for selectors to become quite long and specific in large projects.  Occasionally, instead of writing more specific styles to override them, or providing equally specific selectors and placing them later in the file, we just need to make a quick and dirty override.  This can be done with the the !important declaration. Modifying one of our previous exmples:

```css
#pageContent nav .navList li {color: red !important;}
main#pageContent nav.mainNav .navList li {color: blue;}
```
the color of the text would now be red, even though the selector is less specific AND appears earlier in the file.  !important can be very useful on occasion, but should be used sparingly because it can also easily introduce unintended side-effects.