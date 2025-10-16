# Lab 2: HTML Forms
## Getting Started

1. Create a new folder in your repository named "Lab2".  
1. Add the following files to the folder:
    - index.html
    - styles.css


## Your Mission

Build a page that looks like the following mockup. 

Lab2-Mockup.png

The input elements should be contained within a `<form>` that will POST to https://otapp-cstwebdev.azurewebsites.net .  The page that it is posting to will help you validate that the correct data is being sent.

## Requirements

- All styles must be defined in the CSS file.  You can add classes to whatever elements you like
- Use a CSS Grid for aligning the form elements, see https://css-tricks.com/snippets/css/complete-guide-grid and https://www.w3schools.com/css/css_grid.asp This may stretch you a little bit since we're just starting to cover CSS, but you can do it!
- There should be NO line break elements used (`<br>`)
- The student ID field should be limited to 9 characters
- The course prefix field should be limited to 4 characters
- The course number should be limited to 3 characters
- The form must POST all of the required items to the validation site with nothing extra showing up.
## Other Helpful Notes

- To add hint text to a text input, the attribute is "placeholder".  
- To restrict the length of an input, the attribute is "maxlength".  
- If you find that there are any fields missing that aren't on the mockup, use hidden inputs for them.  

When the assignment is complete, commit the files to your repository and push the commit to GitHub.  