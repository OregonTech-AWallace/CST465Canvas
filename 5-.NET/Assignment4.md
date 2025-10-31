# Assignment 4 - Implementing the MTV Pattern in Django

Sticking with the theme of Lab 3, we are now going to provide similar functionality to what we built with ASP.NET in Django.  We will simplify things a bit just get a feel for how Django is different.

1. Open the Lab3/djangolab folder in VS Code
1. Create a new app named `chores`. To do this, open a terminal and execute
    ```bash
    python manage.py startapp chores
    ```
## Creating the Models
1. Edit the  `models.py` in `Lab3/djangolab/chores` and put in this content
    ```python
    class ChoreLaborer:
        def __init__(self, name="", age=0, difficulty=0):
            self.name = name
            self.age = age
            self._difficulty = 0
            self.difficulty = difficulty  # Use property setter
        
        @property
        def difficulty(self):
            return self._difficulty
        
        @difficulty.setter
        def difficulty(self, value):
            if value < 0:
                self._difficulty = 0
            elif value > 10:
                self._difficulty = 10
            else:
                self._difficulty = value
        
        def __str__(self):
            return self.name

    class ChoreWorkforce:
        def __init__(self):
            self.laborers = []
        
        def add_laborer(self, laborer):
            self.laborers.append(laborer)
    ```
## Creating the Views
1. Edit `views.py` to `Lab3/djangolab/djangolab` and put in this content:
    ```python
    from django.shortcuts import render
    from .models import ChoreLaborer, ChoreWorkforce

    def index(request):
        return render(request, 'chores/index.html')

    def laborers(request):
        # Manually create ChoreLaborer objects
        workforce = ChoreWorkforce()
        
        # Add some sample laborers
        laborer1 = ChoreLaborer("Alice", 25, 7)
        laborer2 = ChoreLaborer("Bob", 30, 4)
        laborer3 = ChoreLaborer("Charlie", 22, 9)
        
        workforce.add_laborer(laborer1)
        workforce.add_laborer(laborer2)
        workforce.add_laborer(laborer3)
        
        context = {
            'workforce': workforce
        }
        return render(request, 'chores/laborers.html', context)
    ```
1. Create a file named `urls.py` in the  `djangolab/chores` folder and put in the following content:
    ```python
    from django.urls import path
    from . import views

    urlpatterns = [
        path('', views.index, name='index'),
        path('laborers', views.laborers, name='laborers'),
    ]
    ```
## Creating the Templates
1. Add a new folder named `templates` to the `djangolab/chores` folder
1. Add a new folder named `chores` to the `djangolab/chores/templates` folder
1. Add a file named `index.html` to the `djangolab/chores/templates/chores` folder
1. Add content to the `index.html` file
1. Create a valid HTML page and add a link that reads "View All Laborers" and points to `laborers.html`
1. Add a file named `laborers.html` to the `djangolab/chores/templates/chores` folder
1. Add the following content to the file
    ```html
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <title>Chore Laborers</title>
    </head>
    <body>
        <h1>Chore Laborers</h1>
        <ul>
        {% for laborer in workforce.laborers %}
            <li>{{ laborer.name }} is {{ laborer.age }} years old and ranks a {{ laborer.difficulty }} on the difficulty scale</li>
        {% endfor %}
        </ul>
    </body>
    </html>
    ```
Verify that your app runs and that you can access the paths `/chores` and `/chores/laborers`  
    ```bash
    python manage.py runserver
    ```
## Add More Things
Up to this point, you have been provided wih everything you need to get this working. Now it's your turn to figure some things out.  I would like you to implement the following:
- Add another view which will generate a new laborer with
    - a name selected from a list of 10 random names
    - a random age that is less than 18
    - a random difficulty value between 0 and 10
- Pass just the single laborer to a template associated with the view
- Output the info about that laborer in the template
 

When you are done, commit your code and push your repo to GitHub.