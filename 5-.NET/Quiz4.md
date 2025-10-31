1. MVC Stands for 
    - **Model View Controller**
    - Minimum Viable Code
    - Most Valuable Classes
    - Modern Viewmodel Compaction

1. Given this class:
    ```csharp
    public class Student
    {
        public string Name {get;set;}
        public int GPA {get;set;}
    }
    ```
    and this code in Program.cs
    ```csharp
    Student student = new Student(){Name = "Steve"};
    int? studentGrade = student?.GPA ?? 4;
    ```
    what is the value of the variable `studentGrade`?

    - null
    - **0**
    - 4
    - Code would not compile

1. The modules that execute in between a request being received from a client and the response being sent back to a client are known as:
    -  Modules
    - **Middleware**
    - Handlers
    - Underwear

1. Which of the following is **not** true of etension methods
    - They must exist in a static class
    - They must be static
    - **They can access private variables/methods of the types they extend**
    - They allow you to add methods to a type which are called just like native methods of that type

1. Which of the following is not a true comparison between the MVC and MTV design patterns?
    - The Model in MVC is most similar to the Model in MTV
    - The Controller in MVC is most similar to the View in MTV
    - The View in MVC is most similar to the Template in MTV
    - **The View in MVC is most similar to the View in MTV**

1. The dancing baby is such an early viral video that it even predates widespread usage of the term "viral"
    - **True**
    - False

1. Given the following variable definition, which option correctly uses string interpolation to include it in a string?
    ```csharp
        string firstName = "Bob";
    ```
    - **`string greeting = $"Hello {firstName} and welcome to our site!";`**
    - `string greeting = "Hello ${firstName} and welcome to our site!";`
    - `string greeting = "Hello " + firstName + "and welcome to our site!";`
    - `string greeting = "Hello @firstName and welcome to our site!`;

1. In ASP.NET MVC, which of the following typical folders would cause the most pain if you decided to rename it:
    - Models
    - **Views**
    - Controllers
    - They would all cause an equal amount of pain

1. All of the following code snippets will compile.  Which one will not create an object identical to the others?
    - Student student = new Student("Hootie", "Owl");
    - **var student = new {firstName = "Hootie", lastName = "Owl"};**
    - var student = new Student("Hootie", "Owl");
    - Student student = new("Hootie","Owl");
    - They will all create identical objects

1. In ASP.NET MVC, the view should contain the majority of the business logic
    - True
    - **False**    