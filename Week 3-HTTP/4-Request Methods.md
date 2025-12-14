# HTTP Request Methods
HTTP request methods are used to specify the desired action to be performed on a given resource. Common methods include:

- **GET**: Retrieve data from a server.  
    Example: Fetching a list of users from an API endpoint.  
    ```http
    GET /users HTTP/1.1
    Host: example.com
    ```

- **POST**: Submit data to be processed to a specified resource.  
    Example: Submitting a new user to the server.  
    ```http
    POST /users HTTP/1.1
    Host: example.com
    Content-Type: application/json

    {
        "name": "John Doe",
        "email": "john.doe@example.com"
    }
    ```

- **PUT**: Update a resource or create it if it does not exist.  
    Example: Updating user information or creating a user if it doesn't exist.  
    ```http
    PUT /users/1 HTTP/1.1
    Host: example.com
    Content-Type: application/json

    {
        "name": "John Doe",
        "email": "john.doe@example.com"
    }
    ```

- **DELETE**: Remove a specified resource.  
    Example: Deleting a user from the server.  
    ```http
    DELETE /users/1 HTTP/1.1
    Host: example.com
    ```

- **PATCH**: Apply partial modifications to a resource.  
    Example: Updating only the email of a user.  
    ```http
    PATCH /users/1 HTTP/1.1
    Host: example.com
    Content-Type: application/json

    {
        "email": "new.email@example.com"
    }
    ```
- **HEAD**: Similar to GET, but it retrieves only the headers and not the body of the response.  
    Example: Checking if a resource exists without downloading it.  
    ```http
    HEAD /users HTTP/1.1
    Host: example.com
    ```

- **OPTIONS**: Describe the communication options for the target resource.  
    Example: Discovering which HTTP methods are supported by a server.  
    ```http
    OPTIONS /users HTTP/1.1
    Host: example.com
    ```

- **CONNECT**: Establish a tunnel to the server identified by the target resource.  
    Example: Used for HTTPS connections through a proxy.  
    ```http
    CONNECT example.com:443 HTTP/1.1
    Host: example.com
    ```

- **TRACE**: Perform a message loop-back test along the path to the target resource.  
    Example: Debugging and testing the connection.  
    ```http
    TRACE /users HTTP/1.1
    Host: example.com
    ```
Each method has its own specific use case and is part of the HTTP protocol.
