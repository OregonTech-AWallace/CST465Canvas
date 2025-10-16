# Week 2 Exercises
These exercises will help reinforce the items we are learning this week.
- Create a new folder in your CST465 Repository and call it Exercises
- Create a Word document named Week2.docx
- For each numbered section below, add a heading with the number to the Word document to organize where to put the items that are asked for

## 2.1 - Getting Familiar with Browser Dev Tools
Being able to effectively use the tools freely available in the browser is a critical skill for any web developer.  Let's get some practice.  You will need to do this on a computer and not your phone.
**MAC USERS:** These directions are written for users with two mouse buttons.  You will have to adjust accordingly.

1. Open a browser and navigate to https://www.oit.edu
1. Right-click on the yellow "Apply" button and select "Inspect".  This should open up a new pane in your browser.  You should notice that an `<a>` element is highlighted in the inspection window.  Right-clicking anywhere else on the page and selecting "Inspect" now will automatically highlight the element that was hovered over when right-clicking.  Neat!  You can also expand/navigate through elements in the HTML
1. Click on the three dots in the upper right corner of the pane.  The Dock Side setting will let you choose where you would like the tools window to appear.  I believe "Dock to side" is the default.  You may leave it as-is if you choose, but I find it is typically easier to work with either using "Dock to bottom" or "Undock into separate window"
1. Have a look at the element styles in the right pane of the DevTools window.  This will show you the full set of styles applied, sorted by specificity from most specific at the top to least specific at the bottom.  When a style is crossed-out, it means that it is overridden by a style in a selector with higher specificity.

### Now for the fun part
This can be used to amaze your friends and family.
1. With the `<a>` element for Apply selected, double-click the word Apply in the DevTools window.  It will show that is now editable.  Change the word to something silly, like 'Supply', or 'Deny', or anything (appropriate) that you desire and hit Enter.  Notice that the rendered version of the web page changes as well.  To onlookers, this may look like you are "hacking" the site, but it does not affect anything on the server. It only modifies the "living" version of the page, the Document Object Model.
2. Now, divert your attention to the right-hand "styles" area.  Change the background property of the displayed selector from `#ffd24f` to a different color.  You may notice that more changes than you were expecting.  Change the color back.

Click the '+' above the styles listed to add a new style element.  Write a selector that would change only the color of the Apply button (Hint: it is the first item in the list)

In the Word document under the 2.1 heading, explain why all of the links changed color at first. 
Then, attach the CSS selector/style you entered to change only the first link, and a screen snip of the buttons at the top of the window. In Windows, you can use the hotkey "Shift + Window + s" in order to open the snipping tool so that you can select only the portion of text you want.  Linux/Mac users, you're on your own.

## 2.2 - CSS Specificity
In the Word document, copy these full selectors and state the number of ID, class/attribute and element selectors for the purpose of determining specificity

```css
body nav ul.primaryNav li{ border: 0}
```
```css
#contentArea { border: 0}
```
```css
html form#contactForm input[name="SSN"] { border: 0}
```
The following two selectors would target the same thing.  What makes them different other than the syntax, and if they were both applied like this, what color would SuperCoolBox be?
```css
#SuperCoolBox {color: blue;}
[id="SuperCoolBox"] {color: red;}
```

## 2.3 Understanding CSS Positioning
We're going to work with the attached HTML File: PositioningExample.html
I want you to try each of the 5 positioning types by applying styles to the .positionable selector.  In the Word doc, paste a screen snip showing how each of the types affects the page, along with an example of how you think each one of these could be used in the real world.



**Submit the Word document to Week 2 Exercises in Canvas**