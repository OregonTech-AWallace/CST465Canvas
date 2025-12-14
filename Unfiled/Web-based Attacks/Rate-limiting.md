# Rate Limiting

Rate limiting is a technique used to control the number of requests a client can make to a server within a specified time window. This helps protect applications from abuse, denial-of-service attacks, and ensures fair resource usage among users.  When the limit is exceeded, the server typically responds with an HTTP 429 "Too Many Requests" status code.

## ASP.NET Core Built-in Rate Limiting

Starting with .NET 7, ASP.NET Core includes built-in rate limiting middleware that provides several algorithms:

### 1. Fixed Window Rate Limiter

Allows a fixed number of requests within a time window:

```csharp
builder.Services.AddRateLimiter(options =>
{
    options.AddFixedWindowLimiter("fixed", limiterOptions =>
    {
        limiterOptions.Window = TimeSpan.FromMinutes(1);
        limiterOptions.PermitLimit = 100;
        limiterOptions.QueueProcessingOrder = QueueProcessingOrder.OldestFirst;
        limiterOptions.QueueLimit = 5;
    });
});
```

### 2. Sliding Window Rate Limiter

Provides smoother rate limiting by dividing the time window into segments:

```csharp
builder.Services.AddRateLimiter(options =>
{
    options.AddSlidingWindowLimiter("sliding", limiterOptions =>
    {
        limiterOptions.Window = TimeSpan.FromMinutes(1);
        limiterOptions.SegmentsPerWindow = 6;
        limiterOptions.PermitLimit = 100;
    });
});
```

### 3. Token Bucket Rate Limiter

Uses a bucket that refills with tokens at a steady rate:

```csharp
builder.Services.AddRateLimiter(options =>
{
    options.AddTokenBucketLimiter("token", limiterOptions =>
    {
        limiterOptions.TokenLimit = 100;
        limiterOptions.ReplenishmentPeriod = TimeSpan.FromSeconds(1);
        limiterOptions.TokensPerPeriod = 10;
    });
});
```

### 4. Concurrency Limiter

Limits the number of concurrent requests:

```csharp
builder.Services.AddRateLimiter(options =>
{
    options.AddConcurrencyLimiter("concurrency", limiterOptions =>
    {
        limiterOptions.PermitLimit = 50;
        limiterOptions.QueueProcessingOrder = QueueProcessingOrder.OldestFirst;
        limiterOptions.QueueLimit = 10;
    });
});
```

## Applying Rate Limiting

### Global Rate Limiting

```csharp
// Add rate limiting middleware
app.UseRateLimiter();

// Configure global policy
builder.Services.AddRateLimiter(options =>
{
    options.GlobalLimiter = PartitionedRateLimiter.Create<HttpContext, string>(
        httpContext => RateLimitPartition.GetFixedWindowLimiter(
            partitionKey: httpContext.User.Identity?.Name ?? httpContext.Request.Headers.Host.ToString(),
            factory: partition => new FixedWindowRateLimiterOptions
            {
                AutoReplenishment = true,
                PermitLimit = 100,
                Window = TimeSpan.FromMinutes(1)
            }));
});
```

### Controller-Level Rate Limiting

```csharp
[EnableRateLimiting("fixed")]
[ApiController]
public class WeatherController : ControllerBase
{
    [HttpGet]
    public IActionResult Get()
    {
        return Ok("Weather data");
    }
}
```

### Action-Level Rate Limiting

```csharp
[HttpPost]
[EnableRateLimiting("fixed")]
public IActionResult CreateUser([FromBody] User user)
{
    // Create user logic
    return Ok();
}
```

## Custom Rate Limiting Policies

You can create custom policies based on user roles, IP addresses, or other criteria:

```csharp
builder.Services.AddRateLimiter(options =>
{
    options.AddPolicy("ApiPolicy", httpContext =>
    {
        var userType = httpContext.User.FindFirst("UserType")?.Value;
        
        return userType switch
        {
            "Premium" => RateLimitPartition.GetTokenBucketLimiter("premium",
                _ => new TokenBucketRateLimiterOptions
                {
                    TokenLimit = 1000,
                    ReplenishmentPeriod = TimeSpan.FromMinutes(1),
                    TokensPerPeriod = 100
                }),
            _ => RateLimitPartition.GetFixedWindowLimiter("standard",
                _ => new FixedWindowRateLimiterOptions
                {
                    PermitLimit = 50,
                    Window = TimeSpan.FromMinutes(1)
                })
        };
    });
});
```

Rate limiting is essential for maintaining application stability, preventing abuse, and ensuring fair resource allocation across users.
