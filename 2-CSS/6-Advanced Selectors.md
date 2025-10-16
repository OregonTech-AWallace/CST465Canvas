# Advanced Selectors

## Pseudo-class Selectors (`:pseudo-class`)
Selects elements based on their state or position.  
**`:hover`**  
Example:  
```css
a:hover { text-decoration: underline; }
```

**`:first-child`**  
Selects the first child of its parent.  
Example:  
```css
li:first-child { font-weight: bold; }
```

**`:last-child`**  
Selects the last child of its parent.  
Example:  
```css
li:last-child { font-style: italic; }
```

**`:nth-child(n)`**  
Selects the nth child of its parent.  
Example:  
```css
tr:nth-child(2) { background-color: #f0f0f0; }
```
**`:focus`**  
Selects an element that has focus.  
Example:  
```css
input:focus { border-color: blue; }
```

### Pseudo-classes with Special Behavior
Each of these pseudo classes is unique in that they do not add to specificity by themselves.  Instead, they take on the specificity of the most specific item within their parenthesis, with the exception of the even more special where which does not contribute to specificity at all

**`:not(selector)`**  
Selects elements that do not match the specified selector.  
Example:  
```css
div:not(.highlight) { color: gray; }
```
**`:has()`**  
Selects elements that contain a certain child or descendant matching the selector inside `:has()`. This is similar to the descendant selector, except it selects the parent containing the descendant and not the descendant itself.
Example:  
```css
article:has(h2) { border: 1px solid #ccc; }
```
**`:is()`**  
A functional pseudo-class that simplifies writing large selectors by matching any of the selectors passed as arguments.  
Example:  
```css
:is(h1, h2, h3) { color: darkblue; }
```

**`:where()`**  
Similar to `:is()`, but with zero specificity, meaning it won't contribute to the specificity of the selector.  
Example:  
```css
:where(header, footer) { background-color: lightgray; }
```


## Pseudo-element Selectors (`::pseudo-element`)
Selects part of an element, such as the first line or first letter.
**`::first-line`**
Example:  
```css
p::first-line { font-weight: bold; }
```
**`::before`**  
Inserts content before the content of an element.  
Example:  
```css
h1::before { content: "★ "; color: gold; }
```

**`::after`**  
Inserts content after the content of an element.  
Example:  
```css
h1::after { content: " ★"; color: gold; }
```

**`::first-letter`**  
Styles the first letter of a block-level element.  
Example:  
```css
p::first-letter { font-size: 2em; color: red; }
```

**`::selection`**  
Styles the portion of an element that is selected by the user.  
Example:  
```css
::selection { background: yellow; color: black; }
```

**`::marker`**  
Styles the marker of a list item.  
Example:  
```css
li::marker { color: blue; font-size: 1.2em; }
```