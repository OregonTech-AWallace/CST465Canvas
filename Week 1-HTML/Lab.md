# Lab 1: Setting up a GitHub Repository
GitHub is tool for managing source code repositories at its core, but offers a lot of other features as well.  You may be using a similar platform, like GitLab, but we'll still start with the basics.

There are a couple of prerequisite pieces of software you will want installed on your machine.  There's a good chance that you already have these  installed.

Git:  Git - Downloads (git-scm.com)

Visual Studio Code: Visual Studio Code - Code Editing. Redefined

## Create a GitHub Account

If you do not already have a GitHub account registered under your Oregon Tech email address, go to https://github.com and create one 

## Creating a Repository

Once you are logged in to GitHub, click the New button to create a new repository. 
Name your repository CST465
Select that this will be a Private repository. 
Check the box for "Add a README file"
In the selection for Add .gitignore, select ".gitignore template: VisualStudio"
Click the "Create repository" button
## Adding Permissions 

On the main page of your repository, select "Settings"
Under the "Access" heading in the sidebar, select "Collaborators"
Click "Add People"
Enter "alan.wallace@oit.edu" and click "Add alan.wallace@oit.edu to this repository"
## Clone Your Repository

You have just created a repository.  Since you selected to create a README file and .gitignore file, the first commit was also made to it.

Open a command prompt or PowerShell terminal
Change directories to the location where you would like to store the local copy of your repository
Use git to clone the repository you created.  You can find the address in the GitHub website by opening your repository and clicking the "<> Code" buttonScreenshot of cloning a repo in GitHub
 
```
git clone https://github.com/OregonTech-AWallace/CST465.git
```
except replacing the URL with the one specific to your repository. You may be asked to authenticate.

You should now have a local copy of your repository to work with

## Adding Some Content

Open the folder for your repository with Visual Studio Code

We have a README.md file in our repository, but nothing in it.  It is standard practice for repositories to have this file. The .md file extension denotes that it is a "Markdown" file.  Markdown is a very simple formatting language used to make the generation of a basic HTML document very easy.  You can find a guide for general usage at Markdown Cheat Sheet | Markdown Guide.  

Here is what I would like you to add in your README.md file:

You can leave the title of CST465 as it is
Add a second level heading with the text "What I'm Hoping to Learn"
Add an unordered list of items with at least 3 things that you are hoping to get out of this class
Add a second level heading with the text "Favorite Programming Languages"
Add an ordered list of items of your top 3 favorite programming languages
## Sync Your Changes to GitHub

First, stage all of your changes for commit
```
git add *
```
Next, commit the changes
```
git commit -m "Completed Lab 1"
```
Now, push your changes back to the remote version of the repository (GitHub)
```
git push origin main
```
Once you have committed/pushed the changes to your repository, send me an email at alan.wallace@oit.edu with the link to your repository (e.g. https://github.com/OregonTech-AWallace/CST465.git)