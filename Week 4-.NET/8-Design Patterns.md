# Model-View-Controller (MVC) Design Pattern

The **Model-View-Controller (MVC)** design pattern is a software architectural pattern commonly used for developing user interfaces. It separates the rendering logic for an application into three interconnected components, which as the name implies are the Model, the View, and the Controller.  Keep in mind that this is a generalized design pattern, and not all web frameworks work exactly the same way.


## Model
- Represents the **data** of the application and may include validation logic.
- Notifies the View of any changes in the data.
- In some frameworks, the Model directly interacts with the database and contains **business logic**.


## View
- Represents the **user interface** of the application.
- Displays data from the Model to the user.
- Sends user input to the Controller for processing.
- While it is not typically recommended, the **view** may contain some **business logic**

## Controller
- Acts as an **intermediary** between the Model and the View.
- Handles user input, processes it (e.g., by updating the Model), and determines which View to display.
- In some frameworks, the Model directly interacts with the database and contains **business logic**.

## Framework-Specific Notes
- In **ASP.NET MVC**, the Model is typically a representation of the data structure, while business logic and database interactions are handled by the Controller or separate service layers.
- In **Ruby on Rails** and **Django**, the Model often contains business logic and interacts directly with the database.
- In **Spring MVC**, the Model is used to pass data between the Controller and the View, with business logic typically handled by service layers.
- In **Angular**, the Model is part of the component class, and the framework uses services for business logic and data interactions.
- In **Vue.js** or **React**, the concept of MVC is less rigid, but the Model is often represented by state management libraries like Vuex or Redux.
- In **PHP**, frameworks like **Laravel** and **Symfony** follow the MVC pattern. The Model represents the data and business logic, the View handles the presentation layer, and the Controller processes user input and coordinates between the Model and the View. Laravel also provides Eloquent ORM for database interactions, making it easier to work with Models.

## MVC Flow for a Typical ASP.NET Website
As ASP.NET is the primary focus of this course, we will look at the flow in this environment first.
1. The first request to an MVC website always invokes the **controller**.  Why?  Because the user has not been presented with a **view** to interact with yet.  The user either types a location into the address bar, or clicks a link from another website, which then will get routed to the controller of the MVC website.
1. The **controller** processes the request.  Many things can happen here, but ultimately this will end with a **model** being generated and combined with a **view** that is returned to the user in the form of an HTML page.
1. The user interacts with the **view**.  Interactions may include reading, scrolling, filling out form inputs, clicking links, or clicking buttons.
1. If the interaction involves an action such as clicking a link that points within the site, or submitting a form, a **controller** is once again invoked.  In the case of form submission, the **model** is passed to the **controller** for processing.


## Benefits of MVC
- **Separation of Concerns**: Each component has a distinct responsibility, making the code easier to maintain and test.
- **Reusability**: Components can be reused across different parts of the application.
- **Scalability**: The modular structure supports scaling the application efficiently.

## Examples
- **Model**: Database records (e.g., user data).
- **View**: HTML templates rendered in the browser.
- **Controller**: Handles HTTP requests and updates the Model or View accordingly.


## MVC in Django, the MTV Design Pattern

The **Model-Template-View (MTV)** design pattern is Django's variation of the MVC pattern. While the core principles are similar, Django uses different terminology and slightly adjusts the responsibilities of each component.

#### Components of MTV

**Model**
    - Represents the **data** and the **business logic** of the application.
    - Defines the structure of the data and interacts with the database.
    - Similar to the Model in MVC.

**Template**
    - Represents the **presentation layer** of the application.
    - Contains the HTML structure and placeholders for dynamic content.
    - Similar to the View in MVC, but with the distinction that it is strictly a template and no logic lives here.

**View**
    - Acts as the **intermediary** between the Model and the Template.
    - Handles HTTP requests, processes data using the Model, and renders the appropriate Template.
    - Similar to the Controller in MVC.

### How MTV Works
1. **User Interaction**: The user sends an HTTP request to the server.
2. **View Processing**: The View processes the request, interacts with the Model, and prepares the data.
3. **Template Rendering**: The Template is rendered with the data provided by the View and sent back as an HTTP response.

#### Key Differences from MVC
- In MTV, the "View" refers to what is called the "Controller" in MVC.
- The "Template" in MTV corresponds to the "View" in MVC.

#### Example in Django
- **Model**: A python class representing a database table (e.g., `User` model).
- **Template**: An HTML file with placeholders for dynamic content (e.g., `user_profile.html`).
- **View**: A Python function or class-based view that handles requests and returns a rendered template (e.g., `user_profile_view`).

The MTV pattern aligns with Django's philosophy of "explicit is better than implicit" and provides a clear separation of concerns for web development.