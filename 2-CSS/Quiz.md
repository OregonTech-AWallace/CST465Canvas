1. In Week 1 we learned that whitespace is generally ignored in HTML, yet the following two blocks will render differently.  Why?

**Block 1:**
```html
<div style="width:100%;">
    <div style="display:inline-block;width:50%;">Some content</div>
    <div style="display:inline-block;width:50%;">Some other content</div>
</div>
```
**Block 2:**
```html
<div style="width:100%"><div style="display:inline-block;width:400px;">Some content</div><div style="display:inline-block;width:400px;">Some other content</div></div>
```

1.  The DevTools in the browser are:
    - A super secret hacking tool
    - A tool that allows inspection of the page and related resources
    - **A tool that allows inspection of the page and related resources, as well as the ability to manipulate the DOM**
    - Not available on a Mac because they can't right-click :'(

1. Given the following CSS, specify the number of each type of selector present
    ```css
    body nav#mainNav > ul > li.active a.btn.btn-primary
    ```
    ID:`1` Class/Attribute:`3` Element:`5`
1. Given the following HTML,  
    ```html
    <nav id="rodentNav">
        <ul>
            <li class="Active">Marmot</li>
            <li>Rockchuck</li>
            <li>Woodchuck</li>
            <li>Groundhog</li>
        </ul>
    </nav>
    ```
    which of the following selectors is the most specific for correctly referencing the element which contains the text "Marmot"?

    - `.Active`
    - `ul #rodentNav .Active`
    - `nav ul li.Active`
    - **`#rodentNav .Active`**
    

1. Margin collapsing impacts
    - Left/right margins
    - Top/Bottom margins
    - All margins

1. Relative positioning and absolute positioning both allow setting position with the top/right/bottom/left properties.  Explain how they differ.

1. Given the following CSS, what is the size of the resulting box?
    ```css
    div{
        height: 50px;
        width: 75px;
        margin: 10px;
        padding: 5px; 
    }
    ```
    Height:\`80\`px Width:\`105\`px

1. Given the following CSS, what is the size of the resulting box?
    ```css
    div{
        height: 100px;
        width: 250px;
        margin: 10px 0 5px 5px;
        padding: 5px 0;
        border: solid 1px #000; 
        box-sizing: border-box;
    }
    ```
    Height:\`115\`px Width:\`255\`px
1. (TF)  The following CSS margin properties are all equivalent:  
    ```css
        margin: 5px;
        margin: 5px 5px;
        margin: 5px 5px 5px;
        margin: 5px 5px 5px 5px;
    ```
1. (MC) The selector `article h2` matches:
    - Any h2 that is a direct child of article
    - Any h2 inside an article at any depth
    - Only the first h2 inside each article
    - All article elements that follow an h2

1. (MC) Which selector targets an element with both classes btn and primary?
    - .btn primary
    - .btn.primary
    - .btn, .primary
    - #btn.primary

1. Which sporting equipment is most likely to be used when it is peanut butter jelly time?
    - A soccer ball
    - A hockey stick
    - Shin guards
    - A baseball bat