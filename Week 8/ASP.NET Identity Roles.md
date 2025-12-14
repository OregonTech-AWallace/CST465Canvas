
# ASP.NET Identity Roles
Roles are a mechanism for grouping users so that permissions can be defined for a set of users instead of on an individual user basis 

## Adding Support for Roles
To Enable Roles in Your Project, edit the identity registration.

`Program.cs`
```csharp
services.AddDefaultIdentity<IdentityUser>()  
           .AddRoles<IdentityRole>() // <-- Add this line 
           .AddEntityFrameworkStores<IdentityProjectContext>();
```

## Working with Roles
You can get information about roles using the RoleManager class built into the Microsoft.AspNetCore.Identity namespace.  To get a reference, use dependency injection:
## Referencing Built-in User and Role Management Services
```csharp
public class HomeController : Controller
{
    private readonly RoleManager<IdentityRole> _RoleManager;
    private readonly UserManager<IdentityUser> _UserManager;

    public HomeController(RoleManager<IdentityRole> roleManager, UserManager<IdentityUser> userManager)
    {
        _RoleManager = roleManager;
    }
}
```
NOTE: If you have created a custom user class that inherits from IdentityUser, replace IdentityUser with that class name



### Listing All Users in a Role
```csharp
public async Task<IActionResult> GetUsersInRole(string roleName)
{
    var usersInRole = await _UserManager.GetUsersInRoleAsync(roleName);
    return View(usersInRole);
}
```

### Adding a User to a Role
```csharp
public async Task<IActionResult> AddUserToRole(string userId, string roleName)
{
    var user = await _UserManager.FindByIdAsync(userId);
    if (user != null)
    {
        var result = await _UserManager.AddToRoleAsync(user, roleName);
        if (result.Succeeded)
        {
            // User successfully added to role
            return RedirectToAction("Index");
        }
    }
    return BadRequest("Failed to add user to role");
}
```

### Removing a User from a Role
```csharp
public async Task<IActionResult> RemoveUserFromRole(string userId, string roleName)
{
    var user = await _UserManager.FindByIdAsync(userId);
    if (user != null)
    {
        var result = await _UserManager.RemoveFromRoleAsync(user, roleName);
        if (result.Succeeded)
        {
            // User successfully removed from role
            return RedirectToAction("Index");
        }
    }
    return BadRequest("Failed to remove user from role");
}
```

### Checking if a User is in a Role
```csharp
public async Task<bool> IsUserInRole(string userId, string roleName)
{
    var user = await _UserManager.FindByIdAsync(userId);
    if (user != null)
    {
        return await _UserManager.IsInRoleAsync(user, roleName);
    }
    return false;
}
```