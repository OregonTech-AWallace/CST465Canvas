Tonight we are going to put into practice some more of the topics we've covered in class.  I've created a project to start with so that (hopefully) things won't get too confusing.

Download Lab6.zipDownload Download Lab6.zip

Build and run it.  Notice that there are some configuration options output on the home page.

Configuration
Let's start by getting our configuration set up the way we want it. Currently there are settings in the appsettings.json file under "Headers" for "Key1" and "Key2".  This isn't all that useful.  I want you to rename Key1 to "LabNumber" and Key2 to "AuthoredBy".  Change the values to something meaningful given those names.

I have provided a class in the "Config" folder named "HeaderOptions".   I want you to modify this so class so that the names match what you have in the appsettings.json file now.

Modify the Views/Home/Index.cshtml files so that it is now outputting the configured values by the new names. 

Check out the Program.cs file to see how the configuration section for HeaderOptions is mapped

Middleware
Now it's time to work with some raw middleware to get a feel for it. 

Run the site and open an inspect panel.  Switch to the "Network" tab and then refresh the web page.  You should see a request to "localhost" appear.  Click on it and then inspect the ResponseHeaders.  You should see one called "SomeHeader".  I want you to modify the class "ConfiggedHeadersMiddleware" so that it instead passes the names (can be hardcoded) and values for the headers configured in the HeaderOptions.  But how do you get access to these you ask?  Dependency injection!  You will change the prototype for the InvokeAsync method as follows:

public async Task InvokeAsync(HttpContext context, IOptions<HeaderOptions> headerOptions)
Now you can access the options in this method.  Cool, right? Once you have completed these changes, when you inspect the page on the network tab, you should see the headers "LabNumber" and "AuthoredBy" being sent. 
Now it's time to create your own middleware.  It will be helpful to use the other two as an example as techniques used in both will be needed. Name your class "OregonTechRedirectMiddleware".  You can review RequestHijackedMiddleware.cs  This piece of middleware will do the following:

1. Set the status code for the response to 302

2. Add a header for "location" with the address "https://www.oit.edu"

3. DON'T call  await _next(context);  in your middleware because we want to short-circuit the pipeline so no other middleware executes after this one.

After you have created the middleware, you will need to register the middleware in the pipeline in Program.cs.  Take a look at the file Middleware/MiddlewareExtensions.cs .  Create another extension method in there to create an easy extension method for registering your middleware.  Call it "UseOregonTechRedirect".  Now register this into the pipeline in Program.cs.  You should see that upon visiting the site now, the user is immediately redirected to the Oregon Tech website.  Neat!