# Cross-Origin Resource Sharing (CORS)

Cross-Origin Resource Sharing (CORS) is a security feature implemented in web browsers to control how resources on a web page can be requested from another domain. It is a mechanism that allows or restricts cross-origin HTTP requests initiated by scripts running in the browser. CORS is essential for enabling secure communication between different origins while preventing unauthorized access.

## "Security"
While touted as a security feature, CORS does not actually restrict a crafty user from calling your web services.  It only restricts **web browsers** that choose to respect CORS from accessing the service.  This is an important distinction.

## How to Register CORS Middleware

In a web application (e.g., ASP.NET Core), you can register and configure CORS middleware to define the allowed origins, HTTP methods, headers, and other policies. Below is an example of how to register CORS middleware in an ASP.NET Core application:

### Example: Registering CORS in ASP.NET Core

## Add CORS Services
In the `Program.cs` file, add the CORS services to the dependency injection container.

```csharp
builder.Services.AddCors(options =>
{
        options.AddPolicy("AllowSpecificOrigins", policy =>
        {
            policy.WithOrigins("https://example.com") // Specify allowed origins
                    .AllowAnyMethod()                  // Allow all HTTP methods
                    .AllowAnyHeader();                 // Allow all headers
        });
});
```

## Use CORS Middleware 
Add the CORS middleware to the request pipeline.

```csharp
//previous lines omitted
var app = builder.Build();

app.UseCors("AllowSpecificOrigins");

app.MapControllers();

app.Run();
```

### Key Points
- Replace `https://example.com` with the domain(s) you want to allow.
- Replace `.WithOrigins` with `.AllowAnyOrigin()` to allow all origins (not recommended for production).
- Use `.AllowCredentials()` if you need to support cookies or authentication headers.

By configuring CORS middleware, you can control how your application handles cross-origin requests.