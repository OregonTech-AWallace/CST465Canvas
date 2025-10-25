1. MVC Stands for 
    - **Model View Controller**
    - Minimum Viable Code
    - Most Valuable Classes
    - Marketing Vision Competition

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

1. Middleware 

1. Which of the following is **not** true of etension methods
    - They must exist in a static class
    - They must be static
    - **They can access private variables/methods of the types they extend**
    - They allow you to add methods to a type which are called just like native methods of that type

1. 