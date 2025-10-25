# Final Project Requirements
The below requirements are based on building your project in ASP.NET.  

I will also allow those that are interested to build their project in another framework (e.g. Ruby on Rails, Django, PHP, etc.). If that is what you choose to do, some of the requirements, such as where business logic and database calls are allowed, may shift depending on best practices within that framework.

## Layout
- All CSS should be placed in an external stylesheet(s)
- A layout file will be used to structure your document.
- Navigation must be provided to all relevant portions of the site. I should never have to directly type in a URL other than the home page in order to access a feature of your site.
- Bootstrap or Tailwind should be used for ensuring that your site looks nice and is mobile-friendly
## Data Layer
- Repositories should inherit an interface and be made available to your project via dependency injection
- You may use whatever data store is appropriate for your specific project. This will probably be SQL Server, but if it makes sense for some data to be in a file, that is okay too-At least 3 types of objects that are stored
- The create table/create procedure statements should be made available in a .sql file that I can easily run to reproduce the environment
- There should be a child class for at least 2 of your repositories that supports caching of data via IMemoryCache (this will be covered in class later)
## Models
- Should use appropriate types for data being represented (as opposed to just making everything a string)
- Should use data annotations for validation.
- Should contain ABSOLUTELY NO business logic
## Views
- C# code should be limited to that which is necessary for rendering. Business logic should not be here
- All of your data should be manageable through the web interface. There should be no need to directly edit the database
- Controllers should contain all business logic
- Dependency injection should be used whenever possible for reducing coupling of your controllers to specific implementations of objects
- Actions should be single-purpose (no using the same action to do both inserts and deletes)
## Security
- Database usernames/passwords should not be checked in to your repository. Instead, you should use User Secrets configuration in order to provide that data to your application (we will cover this in class)
- Your site should be free of vulnerabilities which would allow Cross-Site Scripting (XSS), Cross-Site Request Forgery (XSRF), Form Overposting, or SQL Injection
- The site must use ASP.NET Identity in order to provide login functionality
- There must be a distinction in what is available for at least 3 subsets of users: Anonymous (not logged in users), Logged in Users, and Administrators
- Server-side validation should be in place for all posted data-Client-side validation should be in place via jQuery Unobtrusive validation
## Configuration/Error Handling
- Your site must have configurations for Development and production. - When in production, detailed error messages (stack traces, etc.) should not be available to users
- There should be at least 3 settings managed in a json configuration file
## Grading
The more ambitious the project, the more lenient I will be on things such as places that unexpected exceptions aren't handled, labels that are missing from form fields, HTML validation errors, etc. If your project is very simple, I will expect everything to be flawless when grading. The final project will be demoed to me via Teams and I will be asking questions about it.  This means if you used AI to assist with the project, you'd better understand what it did.
## Options for Extra Points
- Implement Third-Party Login (Facebook/Google/LinkedIn/Twitter/etc)
- Implement at least one component that is asynchronous all the way through (controller/repository)
- Implement and make use of a web service/jQuery to call and load data from the web service