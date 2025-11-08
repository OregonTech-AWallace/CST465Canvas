
# Service Pattern in ASP.NET

## Overview

The Service pattern is a design pattern that encapsulates business logic and data access operations into dedicated service classes. In ASP.NET, this pattern promotes separation of concerns by keeping controllers thin and moving complex logic into reusable service layers.

## Key Benefits

- **Separation of Concerns**: Controllers handle HTTP requests while services handle business logic
- **Testability**: Services can be easily unit tested in isolation
- **Reusability**: Service logic can be shared across multiple controllers
- **Maintainability**: Changes to business logic are centralized in service classes

## Implementation in ASP.NET Core

### 1. Define Service Interface

```csharp
public interface IUserService
{
    Task<User> GetUserByIdAsync(int id);
    Task<IEnumerable<User>> GetAllUsersAsync();
    Task<User> CreateUserAsync(User user);
    Task UpdateUserAsync(User user);
    Task DeleteUserAsync(int id);
}
```

### 2. Implement Service Class

```csharp
public class UserService : IUserService
{
    private readonly IUserRepository _userRepository;
    
    public UserService(IUserRepository userRepository)
    {
        _userRepository = userRepository;
    }
    
    public async Task<User> GetUserByIdAsync(int id)
    {
        if (id <= 0)
            throw new ArgumentException("Invalid user ID");
            
        return await _userRepository.GetByIdAsync(id);
    }
    
    // Additional methods...
}
```

### 3. Register Service in DI Container

```csharp
// Program.cs
builder.Services.AddScoped<IUserService, UserService>();
```

### 4. Inject Service into Controller

```csharp
[ApiController]
[Route("api/[controller]")]
public class UsersController : ControllerBase
{
    private readonly IUserService _userService;
    
    public UsersController(IUserService userService)
    {
        _userService = userService;
    }
    
    [HttpGet("{id}")]
    public async Task<ActionResult<User>> GetUser(int id)
    {
        var user = await _userService.GetUserByIdAsync(id);
        return Ok(user);
    }
}
```

## Service Lifetimes

- **Transient**: New instance created each time requested
- **Scoped**: One instance per HTTP request
- **Singleton**: Single instance for application lifetime

## Best Practices

- Keep services focused on a single responsibility
- Use dependency injection for service dependencies
- Implement proper error handling and validation
- Make services async when dealing with I/O operations
- Use interfaces to enable testing and flexibility
