# HTTP Protocol Basics

## What is HTTP?

**HTTP (HyperText Transfer Protocol)** is the foundation of data communication on the World Wide Web. It defines how messages are formatted and transmitted, and how web servers and browsers should respond to various requests.  HTTP 1.1 and 2.0, which are most commonly used on the web currently are based on the TCP protocol.  HTTP 3 is based on UDP.  Most of you are likely taking the Networks class at the same time as the class, so I will focus simply on HTTP and not the differences in their underlying packets.

## Key Concepts

- **Client-Server Model:** The client (usually a web browser) sends requests to the server, which responds with resources (HTML, images, etc.).
- **Stateless Protocol:** Each HTTP request is independent; the server does not retain information about previous requests.

## HTTP Versions
### 1.1 
HTTP 1.1 introduced several key features that improved upon its predecessor:

- **Persistent Connections:** Connections are kept open for multiple requests and responses, reducing the overhead of establishing new connections.
- **Chunked Transfer Encoding:** Allows data to be sent in chunks, enabling the server to start sending a response before knowing its total size.
- **Host Header:** Enables virtual hosting by allowing multiple domains to share the same IP address.
- **Additional Methods:** Introduced new HTTP methods like `OPTIONS`, `PUT`, and `DELETE`.
- **Cache Control:** Provides more granular control over caching with headers like `Cache-Control` and `ETag`.
- **Content Negotiation:** Allows the client and server to negotiate the best representation of a resource (e.g., language, format).

These features made HTTP 1.1 more efficient and flexible, laying the groundwork for modern web communication.



### 2.0

HTTP 2.0 introduces several improvements over HTTP 1.1:

- **Multiplexing:** Allows multiple requests and responses to be sent simultaneously over a single connection, reducing latency.
- **Header Compression:** Uses HPACK compression to reduce the size of HTTP headers, improving performance.
- **Stream Prioritization:** Enables prioritization of streams, allowing critical resources to load faster.
- **Binary Protocol:** Unlike HTTP 1.1, which is text-based, HTTP 2.0 uses a binary protocol, making it more efficient to parse and less error-prone.
- **Server Push:** Allows the server to preemptively send resources to the client before they are requested, improving load times.

These features make HTTP 2.0 faster and more efficient, especially for modern web applications.

### 3.0
HTTP 3.0 is in the works currently.  The current specification aims to use UDP instead of TCP for connections in order to try and gain even more efficiency. Because it has not reached widespread adoption, we will not be delving in to it.

## HTTP Request Structure
Though you may note that HTTP 2 is more modern, we will be exploring HTTP 1.1 in the upcoming examples instead.  This is because many of the basic concepts are the same, but it is much easier for humans to inspect and understand HTTP 1.1.

An HTTP request typically includes:
- **Request Line:** Specifies the method (GET, POST, etc.), resource URL, and HTTP version.
- **Headers:** Provide additional information (e.g. address requested, content type, user agent).
- **Body:** (Optional) Contains data sent to the server (mainly in POST requests).

**Example:**
```
GET /index.html HTTP/1.1
Host: www.example.com
```

## HTTP Response Structure

An HTTP response includes:
- **Status Line:** Contains the HTTP version, status code, and reason phrase.
- **Headers:** Metadata about the response.
- **Body:** The requested resource (e.g., HTML page).

**Example:**
```
HTTP/1.1 200 OK
Content-Type: text/html

<html>...</html>
```

## Common HTTP Methods

- **GET:** Retrieve data from the server.
- **POST:** Send data to the server.
- **PUT:** Update data on the server.
- **DELETE:** Remove data from the server.
*These are the most common, but there are others

## Common Status Codes

- **200 OK:** Successful request.
- **404 Not Found:** Resource not found.
- **500 Internal Server Error:** Server encountered an error.
*These are the most common for basic use cases, but there are **MANY** others

## Summary

HTTP is a stateless protocol that enables communication between clients and servers on the web. Understanding its basics is essential for web development.