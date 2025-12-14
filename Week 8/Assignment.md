## Getting Started

Starting with Lab 6, we're going to improve upon the Blog. 

1. Convert your blog to use asynchrounous calls.  This will take place in both your blog and your repository (don't forget to update the interface).  
    - Change the names of asynchronous methods to have Async at  the end.  This is a matter of convention and not a requirement of .NET
1. Add a decorator to your BlogRepository implementation to provide data caching of the blog posts.  Make sure to invalidate cached items appropriately when an item is saved.
1. Add Identity to your blog and require that a user logs in to add or edit blog post entries. 
    - Ensure that your connection string is stored in your **User Secrets** file so it doesn't get checked in!

1. Commit the assignment to your repository when done.





