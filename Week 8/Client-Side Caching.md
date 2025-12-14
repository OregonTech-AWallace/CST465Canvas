# Client-Side Caching
## Response Caching
Response caching is caching that is performed by an entity other than the originating server such as a web browser, proxy server or Content Delivery Network.  The latter two I would consider to be server-side caching which will be covered on the next page.
- This form of caching can have a huge impact on how well a large website performs
- The server sends recommendations about how to cache specific resources, but it is up to the client(browser/proxy) whether to respect those settings

### `cache-control` Header
- Specifies directives for caching mechanisms in both requests and responses. 
- Caching directives are unidirectional, meaning that a given directive in a request is not implying that the same directive is to be given in the response.

A `cache-control` header may look like this:
```
cache-control: public, max-age=500
```
There are two parts, the **cacheability** and the **lifetime**
#### Cacheability
| Directive | Description |
|-----------|-------------|
| `public` | Indicates that the response may be cached by any cache. |
| `private` | Indicates that the response is intended for a single user and must not be stored by a shared cache. A private cache (the browser) may store the response. |
| `no-cache` | Forces caches to submit the request to the origin server for validation before releasing a cached copy. |
| `only-if-cached` | Indicates to not retrieve new data. The client only wishes to obtain a cached response, and should not contact the origin-server to see if a newer copy exists. |
| `no-store` | No cache is allowed to store this content EVER |

### Lifetime
There are other properties that can be used besides `max-age`, but they are infrequently used, so they will not be covered.  `max-age` specifies the number of **seconds** that a web browser or caching service should hold on to this copy of the response 

#### Choosing the Right Duration
Different types of content will have different needs for setting `max-age`.  Site images, CSS, script libraries and fonts, for example, are unlikely to be ovewritten with newer versions, so the `max-age` will typically have a values ranging from 1 week to 1 year.  Web page content, on the other hand, will have a much shorter lifetime, often as short as 1 hour.  

## Cache Invalidation
![Hard things in computer science](../Images/8/hard-things.webp)


When it comes to client-side caching, we are very limited in the power we have to force a browser to retrieve fresh content.  This is because once a browser has a file cached, it does not check to see if there is a newer version until the current version has expired.  

If you need to make a quick update to a file, all hope is not lost. Assuming that your web pages themselves have shorter lifetimes, there are two options:

### Renaming the File
By renaming the file and then referencing the new file in your web page(s), the new version will be retrieved because it is seen as a new file. 
```html
<!-- Before -->
<link rel="stylesheet" type="text/css" href="Styles.css">
```
```html
<!-- After -->
<link rel="stylesheet" type="text/css" href="Styles2.css">
```

### Using Querystring Parameters
Renaming, or creating multiple copies of files can cause your source code to get messy.  There is a simpler approach and that is to use a querystring parameter.
```html
<!-- Before -->
<link rel="stylesheet" type="text/css" href="Styles.css">
```
```html
<!-- After -->
<link rel="stylesheet" type="text/css" href="Styles.css?v=2">
```
When serving static files, the querystring is generally ignored when the server is locating the file.  HOWEVER, when it comes to web browsers and caching, the querystring is NOT ignored. 

This means that a browser would see the paths `Styles.css`, `Styles.css?v=2`, and `Styles.css?v=3` as different content and cache them separately