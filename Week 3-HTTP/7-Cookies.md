# Cookies 
Cookies are transmitted like other HTTP headers, but deserve a special 
## What is a Cookie?

A **cookie** is a small piece of data that a server sends to a user's web browser. The browser stores this data and sends it back to the server with subsequent requests. Cookies are commonly used to:

- Maintain user sessions (e.g., keeping a user logged in).
- Track user preferences.
- Enable personalized experiences.
- Implement analytics and tracking.

### Key Properties of Cookies

**Name-Value Pair**: Each cookie consists of a name and a value.  
**Expiration**: Cookies can be set to expire after a specific time or persist until the browser is closed.  
**Domain and Path**: Define the scope of the cookie (i.e., which URLs the cookie is sent to).  
**Secure and HttpOnly Flags**:
    - `Secure`: Ensures the cookie is only sent over HTTPS.
    - `HttpOnly`: Prevents client-side scripts from accessing the cookie.  


## How HTTP Headers Work with Cookies

### Sending Cookies to the Client

When a server wants to set a cookie, it includes a `Set-Cookie` header in its HTTP response. For example:

```
HTTP/1.1 200 OK
Content-Type: text/html
Set-Cookie: sessionId=abc123; HttpOnly; Secure; Path=/; Max-Age=3600
```

This header instructs the browser to store the `sessionId` cookie with the specified properties.

### Sending Cookies Back to the Server

When the browser makes subsequent requests to the same domain, it includes the stored cookies in the `Cookie` header of the HTTP request:

```
GET /dashboard HTTP/1.1
Host: example.com
Cookie: sessionId=abc123
```

This allows the server to identify the user and maintain the session.

---

## Summary of Cookie Lifecycle

1. **Server to Client**: The server sends a `Set-Cookie` header in the HTTP response.
2. **Storage**: The browser stores the cookie based on its properties.
3. **Client to Server**: The browser includes the cookie in the `Cookie` header for future requests.

## Client-created Cookies
While the most common flow involves a server sending a cookie to a browser, it is also possible to create cookies directly in the browser with JavaScript.  This should be used with caution as HttpOnly cookies are not supported in this scenario, meaning that the cookie could be inspected by other scripts potentially allowing for Cross-site Scripting (XSS).

### Cookie Lifetime
Cookies can be classified based on their lifetime:

**Session Cookies**:
- These cookies are temporary and are deleted when the browser is closed.
- They are typically used for session management, such as keeping a user logged in during a browsing session.

**Persistent Cookies**:
- These cookies remain stored on the user's device even after the browser is closed.
- They have an expiration date set using the `Expires` or `Max-Age` attribute.
- Persistent cookies are commonly used for remembering user preferences or login details across sessions.

The lifetime of a cookie is determined by the `Expires` or `Max-Age` attribute:
- **`Expires`**: Specifies the exact date and time when the cookie should expire.
- **`Max-Age`**: Defines the lifetime of the cookie in seconds from the time it is set.

If neither attribute is specified, the cookie defaults to a session cookie.
