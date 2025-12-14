# Web Services

Web services are standardized ways for applications to communicate and exchange data over a network, typically using protocols like HTTP. They enable interoperability between different software systems, often using formats such as XML or JSON for data exchange. 

## Web Service Architectures
Just as there are many different ways the TCP/IP protocol can be used, there are also a variety of different ways that the HTTP protocol can be used to serve content and perform operations.  Here are a few common structures for defining how a client will interact with a web service.  

Unlike data formats that we looked at before where it is not overly difficult to allow the same endpoint to serve JSON, XML or other formats, it would be very difficult to serve the same API using multiple of these formats, which is why most organizations will build all of their APIs using a single architecture.

### REST (REpresentational State Transfer)
This is, by far, the most common approach to web services at this point in time.  Endpoint URLs, request methods and query string parameters are all used together in order to provide an API that is intuitive to understand.  We will be covering this in greater depth.
#### Example Request and Response
**Request**
```http
GET /api/users/123/posts?published=true HTTP/1.1
Host: example.com
Accept: application/json
```
**Response**
```json
{
    "user": {
        "id": "123",
        "name": "Alice Johnson",
        "email": "alice@example.com"
    },
    "posts": [
        {
            "id": "1",
            "title": "Introduction to REST APIs",
            "published": true,
            "created_at": "2024-01-15T10:30:00Z"
        },
        {
            "id": "2", 
            "title": "Advanced REST Patterns",
            "published": true,
            "created_at": "2024-01-20T14:45:00Z"
        }
    ]
}
```

### GraphQL (Graph Query Language)
GraphQL is another widely popular methodology.  It serves all "queries" via a single endpoint.  The advantage of GraphQL is that it allows the client to ask for exactly what they want in a single query instead of having to query multiple endpoints and mash multiple responses together.  The drawback is that the server developer must take care to optimize the back-end.

#### Example Request and Response
**Query**
```json
query {
  user(id: "123") {
    id
    name
    email
    posts {
      id
      title
      published
    }
  }
}
```
**Response**
```json
{
  "data": {
    "user": {
      "id": "123",
      "name": "Alice Johnson",
      "email": "alice@example.com",
      "posts": [
        {
          "id": "1",
          "title": "GraphQL Basics",
          "published": true
        },
        {
          "id": "2",
          "title": "Advanced GraphQL",
          "published": false
        }
      ]
    }
  }
}
```

### SOAP (Simple Object Access Protocol)
In the early days of the web, Microsoft invested heavily in making SOAP the standard for web services.  It uses XML as the data format and had the benefit of defining strict contracts for operations and objects which lended itself well to strongly typed languages like C#.  The data format was often difficult to understand at a glance and required a much larger amount of network traffic, causing it to lose favor.

#### Example Request and Response
**Request**
```xml
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
                  xmlns:usr="http://example.com/user">
   <soapenv:Header/>
   <soapenv:Body>
      <usr:GetUserPostsRequest>
         <usr:UserId>123</usr:UserId>
         <usr:PublishedOnly>true</usr:PublishedOnly>
      </usr:GetUserPostsRequest>
   </soapenv:Body>
</soapenv:Envelope>
```
**Response**
```xml
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
                  xmlns:usr="http://example.com/user">
   <soapenv:Header/>
   <soapenv:Body>
      <usr:GetUserPostsResponse>
         <usr:User>
            <usr:Id>123</usr:Id>
            <usr:Name>Alice Johnson</usr:Name>
            <usr:Email>alice@example.com</usr:Email>
         </usr:User>
         <usr:Posts>
            <usr:Post>
               <usr:Id>1</usr:Id>
               <usr:Title>Introduction to SOAP APIs</usr:Title>
               <usr:Published>true</usr:Published>
               <usr:CreatedAt>2024-01-15T10:30:00Z</usr:CreatedAt>
            </usr:Post>
            <usr:Post>
               <usr:Id>2</usr:Id>
               <usr:Title>SOAP vs REST Comparison</usr:Title>
               <usr:Published>true</usr:Published>
               <usr:CreatedAt>2024-01-20T14:45:00Z</usr:CreatedAt>
            </usr:Post>
         </usr:Posts>
      </usr:GetUserPostsResponse>
   </soapenv:Body>
</soapenv:Envelope>
```

### XML-RPC (eXtensible Markup Language - Remote Procedure Call)
This structure is similar to SOAP both in structure and in that it is rarely used anymore.  It is more understandable/ flexible than SOAP due to the predefined type definitions available, but it is still much less flexible than what REST and GraphQL allow.

#### Example Request and Response
**Request**
```xml
<?xml version="1.0"?>
<methodCall>
    <methodName>getUserPosts</methodName>
    <params>
        <param>
            <value><string>123</string></value>
        </param>
        <param>
            <value><boolean>1</boolean></value>
        </param>
    </params>
</methodCall>
```
**Response**
```xml
<?xml version="1.0"?>
<methodResponse>
    <params>
        <param>
            <value>
                <struct>
                    <member>
                        <name>user</name>
                        <value>
                            <struct>
                                <member>
                                    <name>id</name>
                                    <value><string>123</string></value>
                                </member>
                                <member>
                                    <name>name</name>
                                    <value><string>Alice Johnson</string></value>
                                </member>
                                <member>
                                    <name>email</name>
                                    <value><string>alice@example.com</string></value>
                                </member>
                            </struct>
                        </value>
                    </member>
                    <member>
                        <name>posts</name>
                        <value>
                            <array>
                                <data>
                                    <value>
                                        <struct>
                                            <member>
                                                <name>id</name>
                                                <value><string>1</string></value>
                                            </member>
                                            <member>
                                                <name>title</name>
                                                <value><string>XML-RPC Fundamentals</string></value>
                                            </member>
                                            <member>
                                                <name>published</name>
                                                <value><boolean>1</boolean></value>
                                            </member>
                                            <member>
                                                <name>created_at</name>
                                                <value><string>2024-01-15T10:30:00Z</string></value>
                                            </member>
                                        </struct>
                                    </value>
                                    <value>
                                        <struct>
                                            <member>
                                                <name>id</name>
                                                <value><string>2</string></value>
                                            </member>
                                            <member>
                                                <name>title</name>
                                                <value><string>Legacy Web Services</string></value>
                                            </member>
                                            <member>
                                                <name>published</name>
                                                <value><boolean>1</boolean></value>
                                            </member>
                                            <member>
                                                <name>created_at</name>
                                                <value><string>2024-01-20T14:45:00Z</string></value>
                                            </member>
                                        </struct>
                                    </value>
                                </data>
                            </array>
                        </value>
                    </member>
                </struct>
            </value>
        </param>
    </params>
</methodResponse>
```

### Summary
Web services can be implemented many different ways using many different formats, but most modern implementations utilize the REST structure, or GraphQL.  Comparing the requests/responses in the examples above, it is not difficult to see why, which is why we focus on REST in the next section.