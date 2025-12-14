# Cross-site Scripting (XSS)
Cross-site scripting refers to scripts that get maliciously injected into websites and send private information about users to another site.  

When you allow users to post information to your site, such as when using a forum, or allowing comments for a news article, extra care must be taken to escape content to prevent execution of scripts that could be executed when the content is rendered out to other users.

## Preventing XSS
ASP.NET actually makes it very easy. You have to jump through hoops in order to ALLOW XSS to happen.

With MVC, all outputted values are automatically escaped unless you use a method such as Html.Raw()

If you must allow the user to input HTML, make sure that script tags and JavaScript events are stripped out if you are accepting submissions from users you don't trust

## Mixed with SQL Injection
Keep in mind that if your page content is dynamically loaded from the database, a SQL injection attack could also be used to add hidden content that performs XSS attacks also