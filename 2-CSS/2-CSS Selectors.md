# CSS Selectors
## What is a CSS Selector?

A CSS selector is a pattern used to select and style specific elements in an HTML document. It allows you to target elements based on their type, attributes, class, ID, or their relationship to other elements. By using selectors, you can apply styles to elements dynamically and efficiently, ensuring a consistent and maintainable design across your web pages.

## Types of Selectors
1. **Universal Selector (`*`)**
    - Selects all elements in the document.
    - Example:  
      ```css
      * { margin: 0; }
      ```

2. **Type Selector (Element Selector)**
    - Selects all elements of a given type.
    - Example:  
      ```css
      p { color: blue; }
      ```

3. **Class Selector (`.classname`)**
    - Selects all elements with the specified class attribute.
    - Example:  
      ```css
      .highlight { background: yellow; }
      ```

4. **ID Selector (`#idname`)**
    - Selects a single element with the specified id attribute.
    - Example:  
      ```css
      #header { font-size: 2em; }
      ```

5. **Attribute Selector (`[attribute]`)**
    - Selects elements based on the presence or value of an attribute.
    - Example:  
      ```css
      input[type="text"] { border: 1px solid; }
      ```

## Combining Selectors
Selectors can be combined to apply styles to elements that match multiple criteria.  
Examples:  
### Compound or Chained Selector
Selects all elements that match the selector.  This is commonly used to match an HTML element with multiple classes
```css
div.sidebar.featured {background-color: blue;}
```
Example HTML match:
```html
<div class="sidebar featured">I'm selected</div>
```    
### Descendant Selector (`A B`) 
Selects all elements `B` that are descendants of element `A`.  
```css
div p { color: green; }
```
Example HTML match:
```html
<div>
  <p>I'm selected</p>
</div>
```
### Child Selector (`A > B`)
Selects all elements `B` that are direct children of element `A`.  
```css
ul > li { list-style: none; }
```
Example HTML match:
```html
<ul>
  <li>I'm selected</li>
  <li>I'm selected</li>
  <li>
    I'm selected
    <ol>
      <li>I'm not selected</li>
    </ol>
  </li>
</ul>
```
### Adjacent Sibling Selector (`A + B`)
Selects the first element `B` that is immediately preceded by element `A`.  
```css
h1 + p { font-size: 1.2em; }
```
Example HTML match:
```html
<h1>Page Heading</h1>
<p>I'm selected</p>
<p>I'm not selected</p>
```
### General Sibling Selector (`A ~ B`)
Selects all elements `B` that are siblings of element `A`.  
```css
h1 ~ p { color: gray; }
```
Example HTML match:
```html
<h1>Page Heading</h1>
<p>I'm selected</p>
<p>I'm selected</p>
```

There is no limit to how deep you can nest selectors, and as your web pages get more complex, you will find yourself needing to get very specific in certain circumstances
```css
html[lang="en"] body main#pageContent nav.secondary li a.active { text-decoration: underline;}
```

Example HTML match:
```html
<html lang="en">
  <head><title>CST465</title></head>
  <body>
    <main>
      <nav class="primary">
        <ul>
          <li><a href="https://www.google.com">Google</a></li>
          <li><a class="active" href="https://www.bing.com">Bing (I'm not selected)</a></li>
        </ul>
      </nav>
      <nav class="secondary">
        <ul>
          <li><a href="https://www.google.com">Google</a></li>
          <li><a class="active" href="https://www.bing.com">Bing (I'm selected)</a></li>
        </ul>
      </nav>
    </main>
  </body>
</html>
```