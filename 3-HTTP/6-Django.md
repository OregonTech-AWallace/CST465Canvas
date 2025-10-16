
# Setting Up a Simple Django Web Server on Windows with VS Code

Follow these steps to install dependencies and set up a Django web server on Windows using Visual Studio Code.

## Prerequisites
- Python installed (version 3.8 or later). Download it from [python.org](https://www.python.org/).
- Visual Studio Code installed. Download it from [code.visualstudio.com](https://code.visualstudio.com/).
- Git installed (optional but recommended). Download it from [git-scm.com](https://git-scm.com/).

## Steps

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


1. Open a terminal in VS Code or Command Prompt.
2. Create a virtual environment:
    ```bash
    python -m venv venv
    ```
3. Activate the virtual environment:
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

### 3. Create a Django Project
1. Run the following command to create a new Django project:
    ```bash
    django-admin startproject myproject
    ```
2. Navigate into the project directory:
    ```bash
    cd myproject
    ```

### 4. Run the Development Server
1. Start the Django development server:
    ```bash
    python manage.py runserver
    ```
2. Open your browser and go to `http://127.0.0.1:8000/` to see the default Django welcome page.

### 5. Configure VS Code for Django
1. Install the Python extension for VS Code from the Extensions Marketplace.
2. Open your Django project folder in VS Code.
3. Select the Python interpreter for your virtual environment:
    - Press `Ctrl+Shift+P` and type `Python: Select Interpreter`.
    - Choose the interpreter from your virtual environment.

### 6. Additional Tips
- Use the integrated terminal in VS Code for running commands.
- To stop the server, press `Ctrl+C` in the terminal.

You now have a simple Django web server running on your Windows machine with VS Code!
