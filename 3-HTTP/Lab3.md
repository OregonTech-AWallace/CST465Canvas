
# Lab 3: Setting Up Simple Application/Web Servers

Follow these steps to install dependencies and set up a Django web server on Windows using Visual Studio Code.

## Prerequisites
- Python installed (version 3.8 or later).  
 [Download from python.org](https://www.python.org/downloads/).
- .NET Core 9.x installed   
[Download from dotnet.microsoft.com](https://dotnet.microsoft.com/en-us/download)
## Django Dev Server

### 1. Install Python and Pip
1. Ensure Python is added to your system PATH during installation.
2. Verify the installation:  
```bash
python --version
pip --version
```

### Create a Virtual Environment

Creating a virtual environment in Python provides several benefits, especially in projects like Django development. Here's why it's important:

- **Isolation of Dependencies**: A virtual environment creates an isolated space for your project's dependencies. This means that any libraries or packages you install (e.g., Django, third-party libraries) are specific to this project and won't interfere with other Python projects on your system. Without a virtual environment, all packages are installed globally, which can lead to version conflicts between projects.
- **Version Management**: Different projects may require different versions of the same library. For example, one project might use Django 3.2, while another requires Django 4.0. A virtual environment ensures that each project can maintain its own version of dependencies.
- **Cleaner Development Environment**: By keeping dependencies local to the project, your global Python environment remains clean and free of unnecessary packages.
- **Reproducibility**: Virtual environments make it easier to share your project with others. By using tools like `requirements.txt` (generated with `pip freeze`), collaborators can recreate the exact environment on their systems.
- **Avoiding Permission Issues**: Installing packages globally often requires administrative privileges. Virtual environments allow you to install packages locally without needing elevated permissions.


1. Create a new folder in your repository called Lab3
1. Open a terminal in VS Code or Command Prompt.
1. Change directories to the Lab3 folder you just created.
1. Create a virtual environment:
    ```bash
    python -m venv venv
    ```
1. Activate the virtual environment:
    - For Command Prompt:
        ```bash
        venv\Scripts\activate
        ```
    - For PowerShell:
        ```bash
        .\venv\Scripts\Activate.ps1
        ```

### Install Django

4. Install Django:
    ```bash
    pip install django
    ```

### Create a Django Project
1. Run the following command to create a new Django project:
    ```bash
    django-admin startproject djangolab
    ```
2. Navigate into the project directory:
    ```bash
    cd djangolab
    ```

### Run the Development Server
1. Start the Django development server:
    ```bash
    python manage.py runserver
    ```
2. Open your browser and go to `http://127.0.0.1:8000/` to see the default Django welcome page.

### Configure VS Code for Django
1. Install the Python extension for VS Code from the Extensions Marketplace.
2. Open your Django project folder in VS Code.
3. Select the Python interpreter for your virtual environment:
    - Press `Ctrl+Shift+P` and type `Python: Select Interpreter`.
    - Choose the interpreter from your virtual environment.

### Additional Tips
- To stop the server, press `Ctrl+C` in the terminal.

You now have a simple Django web server running on your Windows machine with VS Code!

## ASP.NET (Kestrel) Server
1. Make a new folder in your Lab3 folder named "dotnetlab"
1. In a terminal window, navigate to the dotnetlab directory
1. Run the following command:
    ```bash
    dotnet new web
    ```
1. Run the following command:
    ```bash
    dotnet run
    ```

1. Once it finishes loading, navigate to the URL displayed

That's it, you've created an ASP.NET web application

![Dude, wait. What?](../Images/3/dudewaitwhat.jpg)

Yes, it really was that simple

## Let's Make Things Interesting
Okay, so that was way too easy.  Let's have some more fun.

### Adding Static Content to Django
1. In the top-level djangolab folder (at the same level as manage.py), add a new folder named "static"
1. Add an index.html document with some basic HTML
1. Edit the file djangolab/djangolab/settings.py
1. Add the following lines after the STATIC_URL setting
    ```python
    STATICFILES_DIRS = [
        BASE_DIR / "static",
    ]

    STATIC_ROOT = BASE_DIR / "staticfiles"
    ```
1. Edit the file urls.py and add the following two lines near the top:
    ```python
    from django.conf import settings
    from django.conf.urls.static import static
    ```
    and this one at the bottom
    ```python
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATICFILES_DIRS[0])
    ```
1. Restart the application and try navigating to http://127.0.0.1:8000/static/index.html

## Adding Static Content to ASP.NET
1. In the top level dotnetlab folder, add a new folder named "wwwroot"
1. Add an index.html document with some basic HTML.  It's fine to copy the file from the previous section, but add something to it so you can tell that it is a different file
1. Add the following line above app.MapGet in `Program.cs`
    ```C#
    app.UseStaticFiles();
    ```
1. Run the application and navigate to the URL
1. Enter '/index.html' at the end of the location in the browser and press enter

WOAH, that was easy.


## Wrapping up
Demo to me that you have both servers working and capable of serving static content.

**NOTE:** The point of this lab is not to try and say that one framework is superior to another, but rather to show that they have similar functionality with different ideas about how to implement it.  At times it can be daunting that .NET hides so much of the implementation behind the scenes because we may not know where to start when we DO need to dig in and change defaults.