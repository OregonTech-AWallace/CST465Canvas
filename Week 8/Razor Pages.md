# Razor Pages
In the early days of ASP.NET (early 2000s), Microsoft developed a framework known as **WebForms**.  This was a pretty cool idea for its time.  It provided the developer the ability to make pages that consisted of a rendering template file which vaguely resembled HTML, and a back-end file known as the "code-behind" which was written in straight C# or VB.NET and had a specialized class structure for interacting with events in the page lifecycle.  

While it was pretty amazing at the time, it suffered from several major drawbacks:
- It was not easy to perform unit testing.  Tight-coupling existed between pages and depdendent services
- The template format required a lot of specialized tags and attributes that had to exist on EVERY element for ceremony.
- Every page had to contain a form element in order to provide dynamic functionality, whether it was actually made sense to have a form or not.

ASP.NET MVC was implemented to solve these problems.  
- With Dependency Injection, loose-coupling and testing was now easily accomplished.  
- The razor syntax allowed for templating that felt much closer to HTML and could be implemented without forms where they weren't needed.

Even still, MVC requires a lot of ceremony also, having to maintain code in three different places (Model, View, and Controller) just to implement a single simple page.  

**Razor Pages** were created in order to bring the best of both worlds together.  