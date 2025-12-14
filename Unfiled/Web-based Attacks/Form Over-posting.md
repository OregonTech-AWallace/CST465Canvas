# Form Over-Posting
To perform an Over-Posting Attack, you must know what the name of an item in the model is that you want to over post.  

Here is the definition of a model for a user:
`UserModel.cs`
```csharp
public class User
{
    public int ID {get;set;}
    public string Name{get;set;}
    //Nullable.  Server does not try to change it if null.  Admins have an edit form where they can set this for users
    public bool? IsAdmin{get;set;}
}
```
Suppose I have a page that displays information to the user:
**ID: ** 1
**Name: ** Alan
**Is Admin? ** False

I then have an edit page which allows the user to edit their name:
**Name: ** _____________

You may have the best of intentions that since the IsAdmin field isn't on the edit form, it will be seen as null on the server side and ignored when updating the user.  You can't trust your users however.  

If a user determines that the name of the field on our model is "IsAdmin", they could add this to their form in the Chrome Inspect tools:
```html
<input type="hidden" name="IsAdmin" value="true" />
```

Now, when they submit the form, **model-binding** will take place and automatically bind true to the IsAdmin field.

## Preventing Over-Posting Attacks
### Method 1: Use separate models for operations
Here we have a model used for our edit action that is different from the model used for viewing the user.  It doesn't include the IsAdmin flag because they are not allowed to do anything with it
`UserEditModel.cs`
```csharp
public class UserEditModel
{
    public int ID {get;set;}
    public string Name{get;set;}
}
```
For the admin view, we use a separate model/controller action since they are allowed to handle the IsAdmin flag.  Even though this is identical to the `UserModel` now, we keep them separate to prevent similar issues in the future.
`AdminUserEditModel.cs`
```csharp
public class AdminUserEditModel
{
    public int ID {get;set;}
    public string Name{get;set;}
    
    public bool? IsAdmin{get;set;}
}
```

### Method 2: Restrict Binding
Another solution is to explicitly tell your controller method which properties of the model it should be expecting via the Bind attribute
```csharp
//Bind ONLY the named properties to the model object
public IActionResult Update([Bind("ID", "Name")]UserModel model)
{
}
```