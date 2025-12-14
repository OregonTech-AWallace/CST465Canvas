# User Secrets

User Secrets is a development-time feature in ASP.NET that allows you to store sensitive configuration data outside of your project tree. This prevents accidentally committing secrets like API keys, connection strings, and passwords to source control.

## How User Secrets Work
- Each project will need to generate a unique identifier (UserSecretsId)
- Secrets are stored locally on your development machine in a JSON file in your user profile directory.  


## Setting Up User Secrets

### Enable User Secrets
```bash
dotnet user-secrets init
```

This adds a `UserSecretsId` to your `.csproj` file:
```xml
<PropertyGroup>
    <UserSecretsId>your-unique-guid</UserSecretsId>
</PropertyGroup>
```

### Managing Secrets

#### Set a Secret
```bash
dotnet user-secrets set "ApiKey" "your-secret-api-key"
dotnet user-secrets set "ConnectionStrings:DefaultConnection" "Server=localhost;Database=MyDb;"
```

#### List All Secrets
```bash
dotnet user-secrets list
```

#### Remove a Secret
```bash
dotnet user-secrets remove "ApiKey"
```

#### Clear All Secrets
```bash
dotnet user-secrets clear
```

## Using Secrets in Code

Access secrets through the configuration system:

```csharp
public class HomeController : Controller
{
        private readonly IConfiguration _Config;

        public HomeController(IConfiguration config)
        {
                _Config = config;
        }

        public IActionResult Index()
        {
                var apiKey = _Config["ApiKey"];
                var connectionString = _Config.GetConnectionString("DefaultConnection");
                return View();
        }
}
```

## Storage Location
Secrets are stored in:
- **Windows**: `%APPDATA%\Microsoft\UserSecrets\<user_secrets_id>\secrets.json`
- **Linux/macOS**: `~/.microsoft/usersecrets/<user_secrets_id>/secrets.json`

## Limitations
- Only works in Development environment by default.  Solutions such as Azure Key Vault are more appropriate for production use
- Secrets are stored in plain text on disk. 
- Machine-specific (not shared across team members)