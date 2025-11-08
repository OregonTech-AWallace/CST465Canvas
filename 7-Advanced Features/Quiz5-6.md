1. There are many types inheriting from IActionResult.  The ASP.NET Controller base class has built-in methods for returning many of them.  What type does the following code return?
    ```csharp
    public IActionResult Index()
    {
        return View();
    }
    ```
    - **ViewResult**
    - ContentResult
    - JsonResult
    - HTMLResult

1. The process by which ASP.NET takes submitted form key value pairs and maps them to properties of controller action parameter is known as 
    - **Model Binding**
    - Parameter Binding
    - Form Mapping
    - Value Mapping

1.  With regards to the line from the Star Wars video, "And you know that we got it", what is "it"
    - Swagger
    - **Death Star**
    - Luke's hand
    - The Force

1. Which of the following are true about client-side validation in ASP.NET
    - It can take the place of server-side validation
    - **It requires inclusion of special JavaScript**
    - **It provides for a better user experience**
    - **It can help reduce traffic to your website**

1. Which of the following values for `conditional statement` would check if a model posted to the server is valid?
    ```csharp
    [HttpPost]
    public IActionResult Index(MyModel model)
    {
        if(<conditional statement>)
        {
            //Validation failed
            return View(model);
        }
        return RedirectToAction("Success");
    }
    ```

    - **!ModelState.IsValid**
    - model == null
    - model is null
    - !model.IsValid

1. 