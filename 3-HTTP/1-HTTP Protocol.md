# HTTP Protocol Basics

## What is HTTP?

**HTTP (HyperText Transfer Protocol)** is the foundation of data communication on the World Wide Web. It defines how messages are formatted and transmitted, and how web servers and browsers should respond to various requests.  HTTP 1.1 and 2.0, which are most commonly used on the web currently are based on the TCP protocol.  HTTP 3 is based on UDP.  Most of you are likely taking the Networks class at the same time as the class, so I will focus simply on HTTP and not the differences in their underlying packets.

## Key Concepts

- **Client-Server Model:** The client (usually a web browser) sends requests to the server, which responds with resources (HTML, images, etc.).
- **Stateless Protocol:** Each HTTP request is independent; the server does not retain information about previous requests.

## HTTP 1.1 
The following examples are specific to HTTP 1.1.  Though you may note that HTTP 2 is more modern, we will be exploring HTTP 1.1 instead because many of the basic concepts are the same, but it is much easier for humans to inspect and understand.

## HTTP Request Structure

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