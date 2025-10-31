
# ASP.NET Data Annotations and Validation for View Models

## Overview

ASP.NET Data Annotations are attributes that can be applied to model classes and their properties to provide metadata about the data. They serve multiple purposes including validation, display formatting, and database schema generation.

## How Data Annotations Work

Data annotations work by decorating your model properties with specific attributes that the ASP.NET framework interprets at runtime. These attributes provide instructions to various components of the framework.

### Model Validation
- Attributes like `[Required]`, `[Range]`, `[StringLength]` validate data
- Validation can be performed server-side with default configuration and client-side using JavaScript which is recommended, but requires additional configuration
- Invalid models prevent controller actions from executing

### Display Formatting
- `[Display]` controls how properties appear in UI
- `[DisplayFormat]` handles date/time and numeric formatting
- `[DataType]` provides semantic information for rendering

## Common Data Annotations

### Validation Attributes
```csharp
[Required(ErrorMessage = "Name is required")]
public string Name { get; set; }

[Range(1, 100, ErrorMessage = "Age must be between 1 and 100")]
public int Age { get; set; }

[StringLength(50, MinimumLength = 2)]
public string Title { get; set; }

[EmailAddress]
public string Email { get; set; }
```

### Display Attributes
```csharp
[Display(Name = "Full Name", Description = "Enter your complete name")]
public string FullName { get; set; }

[DataType(DataType.Password)]
public string Password { get; set; }

[DisplayFormat(DataFormatString = "{0:C}")]
public decimal Price { get; set; }
```

## Benefits

1. **Centralized Validation Logic** - Rules are defined once in the model
2. **Automatic UI Generation** - Scaffolding uses annotations for form generation
3. **Client-Side Validation** - JavaScript validation generated automatically

5. **Consistency** - Same rules apply across the entire application

## Integration with MVC

Data annotations integrate seamlessly with ASP.NET MVC:
- Model binding respects validation attributes
- Razor views automatically generate validation messages
- HTML helpers use display attributes for labels
- Validation occurs before controller actions execute
