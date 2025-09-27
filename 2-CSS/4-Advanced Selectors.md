**Descendant Selector (`ancestor descendant`)**
- Selects elements that are descendants of a specified ancestor.
- Example:  
    ```css
    div p { margin: 1em; }
    ```

**Child Selector (`parent > child`)**
- Selects elements that are direct children of a specified parent.
- Example:  
    ```css
    ul > li { list-style: none; }
    ```

**Adjacent Sibling Selector (`element + element`)**
- Selects an element that is immediately preceded by a specified sibling.
- Example:  
    ```css
    h2 + p { font-weight: bold; }
    ```

**General Sibling Selector (`element ~ element`)**
- Selects all siblings that follow a specified element.
- Example:  
    ```css
    h2 ~ p { color: gray; }
    ```

**Pseudo-class Selector (`:pseudo-class`)**
- Selects elements based on their state or position.
- Example:  
    ```css
    a:hover { text-decoration: underline; }
    ```

**Pseudo-element Selector (`::pseudo-element`)**
- Selects part of an element, such as the first line or first letter.
- Example:  
    ```css
    p::first-line { font-weight: bold; }
    ```

**`:has()` Selector**
- Selects elements that contain a certain child or descendant matching the selector inside `:has()`.
- Example:  
    ```css
    article:has(h2) { border: 1px solid #ccc; }
    ```

> These selectors can be combined to target elements with precision and flexibility in CSS.