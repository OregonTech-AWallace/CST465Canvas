# Publishing Your Content to the World with GitHub Pages
Several people have asked for a way to publish a web page to the world.  We're going to look at a very simple way to do that.

**ASSUME THAT ALL FILE/FOLDER NAMES I MENTION ARE CASE SENSITIVE**

## Create a New Repository
1. In GitHub, create a new **public** repository.  Call it "CST465 Project"
## Adding Some Content
1. Create a new folder called "docs" at the root of your repository.
1. Add a new file named "index.html" to that folder
1. Add all necessary code for a valid HTML file to index.html
1. Add a title and h1 to the page with the text "CST465 Project"
1. Add an unordered list to the page of ideas you have for a project this term.  
1. Commit these changes to your repository and push to GitHub

## Setting Up Basic Publishing in GitHub
1. Open the web browser and access your GitHub repository
1. Click on the "Settings" tab
1. Click "Pages" in the the "Code and automation" section of the sidebar menu
1. Ensure Source is set to "Deploy from a branch"
1. Under branch, set branch as "main" and folder as "/docs"
1. Click Save

## Watch it Go!
1. Click the Actions tab at the top.  You should see a workflow named "pages build and deployment" running.  Wait for it to finish with a green check mark.  You can click into the workflow and view the steps that were executed, but a lot of it may not make much sense at this point.  We'll get there!
1. Click on the "Settings" tab again and go back to "Pages".  You should now see a section at the top that says "Your site is live at..." with a link.
1. Click the link.  If all was successful, you should see the index.html page and be able to click the link to access your syllabus assignment, live on the World Wide Web.  NEAT!

## Submitting this Assignment
Submit the URL for your GitHub Pages page in Canvas
