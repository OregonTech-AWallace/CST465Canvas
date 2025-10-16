# Introduction to CSS

**CSS (Cascading Style Sheets)** is a language used to describe the presentation of HTML documents. It controls the layout, colors, fonts, and overall visual appearance of web pages.

## How to Use CSS

There are four main ways CSS is applied to HTML:

1. **Inline CSS**  
    Add the `style` attribute directly to HTML elements:
    ```html
    <p style="color: blue;">This is a blue paragraph.</p>
    ```

2. **Internal CSS**  
    Place CSS rules inside a `<style>` tag within the `<head>` section of your HTML:
    ```html
    <head>
      <style>
         p {
            color: green;
         }
      </style>
    </head>
    ```

3. **External CSS**  
    Write CSS in a separate `.css` file and link it to your HTML.  The file can be given any file name supported by the web browser:
    ```html
    <link rel="stylesheet" href="styles.css">
    ```
    In `styles.css`:
    ```css
    p {
      color: red;
    }
    ```

4. **Browser Default Style Sheet**  
    Every web browser has a built-in stylesheet that tells it how to render elements by default.  This is how `<strong>` elements are bold by default for example.  Be 

## Example CSS Rule

```css
h1 {
  font-size: 2em;
  color: navy;
  text-align: center;
}
```

This rule styles all `<h1>` elements to have a larger font size, navy color, and centered text.

Be sure to check the Common CSS Properties document for a larger (but still limited) list of properties
