# Common HTTP Headers
Headers provide a mechanism to send information with an HTTP request/response that the user

## Headers Sent by the Client

- **Host**: Specifies the domain name of the server.  You may be wondering "Why would I need to send this as a header? I already typed this into the address bar of the browser."  The web server does not actually know what hostname you typed into the browser.  That address is resolved via DNS to an IP address. If a web server will always serve the same response independent of the hostname used, the host header is not necessary.  It is a common, however, for web servers to serve more than one website, or less commonly, vary their behavior to the same site based on hostname.  In this case, the web server is unable to process the request without the Host header.

- **User-Agent**: Identifies the client software making the request.
- **Accept**: Indicates the media types the client can process.
- **Content-Type**: Describes the type of data in the request body.
- **Content-Length**: The size of the request body in bytes.
- **Authorization**: Contains credentials for authenticating the client.
- **Cookie**: Sends stored cookies from the client to the server.
- **Cache-Control**: Directs caching behavior for requests.
- **Referer**: Indicates the URL of the previous web page from which a link was followed.
- **Connection**: Controls whether the network connection stays open after the current transaction.
- **Accept-Encoding**: Lists the encoding types the client can handle (e.g., gzip).
- **If-Modified-Since**: Requests the resource only if it has been modified since the specified date.

## Headers Sent by the Server

- **Content-Type**: Describes the type of data in the response body.
- **Content-Length**: The size of the response body in bytes.
- **Set-Cookie**: Used by the server to send cookies to the client.
- **Cache-Control**: Directs caching behavior for responses. (We'll cover this in more depth later)
- **Location**: Used to specify the destination URL of a redirect or to specify the URL of a newly created resource.
- **ETag**: Provides a unique identifier for a specific version of a resource.