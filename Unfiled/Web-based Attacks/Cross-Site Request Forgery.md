# Cross-site Request Forgery (XSRF)
Cross-Site Request Forgery is a technique where a malicious link is sent to the user via email or from another website.  

Upon clicking the link, JavaScript automatically submits a form on behalf of the user to another site.

Since it comes from the users browser, the request operates under the security context of the user.


## Preventing XSRF
ASP.NET MVC helps prevent CSRF by use of what they call an Anti-Forgery Token.

The token is set as a hidden field to forms on your site via
When you build a form with the ASP.NET tag helpers like this:
```html
<form asp-action="Add" asp-controller="RatableThing" method="post">
</form>
```
It will automatically add an extra hidden input like this:
```html
<input name="__RequestVerificationToken" type="hidden" value="CfDJ8EpedTD7Fw5CiMVo8gLdIFzQ2S2wkeTYudxVtJpckpLHGcwGFP07lXZjTUdg9w4XGh3R7g1aT-S_ENTuJxN2Xhwyp9CSafC4agHnFhyWkl_13QYl2LENixvjoyJj1cc20ZCfthHPIVKAqfSBAxbKD2c">
```
and create a cookie in the browser to match:
```
Name: .AspNetCore.Antiforgery.rbDcgQ4edqQ
Value: CfDJ8EpedTD7Fw5CiMVo8gLdIFxKr9Xb3OoVTEjbpG9sj9QR4aXXuf9WtsPzzm87sA1O6PjPp5w8olhvGaLrWc1oI-agZQsXHgq0lvsWRS62EtWWUUIASHxjxcmJ6EFmJkILZC0723RcYxuwDXn7m7aAHqk
```
The cookie in the browser that is NOT accessible by JavaScript

When the form post happens, the server verifies that both the cookie token and the form value match.  Since the attacking server/email can't read your cookie, it can't know what to set the form value to, thus thwarting the attack.  

There used to be the need to add the attribute `[ValidateAntiForgeryToken]` to your controller actions where you wanted this verification to happen, but in current versions of ASP.NET, this happens automatically.

## Example
Suppose you build a site called https://supertaxes.com and your site has a page used to send an email with the user's tax information to the email address typed into a box.
### Without Protection
1. User logs in to your website. An authentication cookie is stored in their browser.
1.  User gets distracted, checks their email and clicks on a link.  The link takes the user to a malicious website.  The website renders HTML like this:
    ```html

    <form id="badwolf" action="https://supertaxes.com/send-me-my-info" method="POST">
        <input type="hidden" value="nefarious_BIG@malintentioned.com">
    </form>
    <script>
    //Get a reference to the form
    const form = document.getElementById('badwolf');

    // Submit the form programmatically
    form.submit();

    </script>
    ```

1. The user has now performed the equivalent of completing the form and clicking submit on the page in the website by only just clicking a bad link.

### With Protection
The result is the same until the last step, but now this is what happens:

3a. The server looks at the value of the cookie starting with .AspNetCore.Antiforgery and compares it with the form element with name __RequestVerificationToken

If the values do not match, the request is rejected.  Even if the malicious site tries to add a form field with the name __RequestVerificationToken, they do not have a way to know what the value should be.