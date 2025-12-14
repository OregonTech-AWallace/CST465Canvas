# Intro to Django MTV

The Django MTV (Model-Template-View) architecture is a design pattern used to structure Django applications. Below are the conventions for building a Django MTV app:

## **Apps in Django**
Apps are modular components of a Django project. Each app is designed to handle a specific functionality.

### **Creation**
Use the command `python manage.py startapp app_name` to create an app.

### **Structure** 
Each app typically contains the following files:
- `models.py`: Defines the data structure (database tables).
- `views.py`: Contains the logic for handling requests and returning responses.
- `urls.py`: Maps URLs to views.
- `templates/`: Contains HTML files for rendering views.
- `static/`: Stores static files like CSS, JavaScript, and images.

### **Loading Apps**
Add the app to the `INSTALLED_APPS` list in the `settings.py` file of your project:
```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    ...
    'app_name',
]
```
This ensures Django recognizes the app and includes it in the project.

## **Placing Data**
**Models**:
Define your data structure in `models.py` using Django's ORM.

Example:
```python
from django.db import models

class Item(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
```
- Run `python manage.py makemigrations` and `python manage.py migrate` to apply changes to the database.

**Templates**:
- Store HTML files in the `templates/` directory of your app.
- Use the `render()` function in views to return templates.
- Example directory structure:
```
app_name/
└── templates/
    └── app_name/
        └── template_name.html
```

**Views**:
- Write view functions in `views.py` to handle HTTP requests.
- Example:
```python
from django.shortcuts import render

def home(request):
    return render(request, 'app_name/home.html')
```

## **URL Configuration**
Define app-specific URLs in `urls.py` within the app:
```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
]
```
Include the app's `urls.py` in the project's `urls.py`:
```python
from django.urls import include, path

urlpatterns = [
    path('app_name/', include('app_name.urls')),
]
```


