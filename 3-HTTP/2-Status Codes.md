# HTTP Status Codes and Meanings

## 1xx: Informational
- **100 Continue**: Request received, continue process.
- **101 Switching Protocols**: Protocols are being switched.
- **102 Processing**: Request is being processed (WebDAV).
- **103 Early Hints**: Preliminary response with headers.

## 2xx: Success
- **200 OK**: Request succeeded.
- **201 Created**: Resource created.
- **202 Accepted**: Request accepted, processing pending.
- **204 No Content**: No content to send.
- **206 Partial Content**: Partial content delivered.

## 3xx: Redirection
- **300 Multiple Choices**: Multiple options for resource.
- **301 Moved Permanently**: Resource moved permanently.
- **302 Found**: Resource temporarily moved.
- **303 See Other**: See another resource.
- **304 Not Modified**: Resource not modified.
- **305 Use Proxy**: Use proxy (deprecated).
- **306 (Unused)**: Reserved.
- **307 Temporary Redirect**: Temporary redirect.
- **308 Permanent Redirect**: Permanent redirect.

## 4xx: Client Errors
- **400 Bad Request**: Malformed request.
- **401 Unauthorized**: Authentication required.
- **402 Payment Required**: Reserved for future use.
- **403 Forbidden**: Server refuses action.
- **404 Not Found**: Resource not found.
- **405 Method Not Allowed**: Method not allowed.
- **406 Not Acceptable**: Resource not acceptable.
- **407 Proxy Authentication Required**: Proxy authentication required.
- **408 Request Timeout**: Request timed out.
- **409 Conflict**: Request conflict.
- **410 Gone**: Resource gone.
- **411 Length Required**: Content length required.
- **412 Precondition Failed**: Precondition failed.
- **413 Payload Too Large**: Request entity too large.
- **414 URI Too Long**: URI too long.
- **415 Unsupported Media Type**: Media type unsupported.
- **416 Range Not Satisfiable**: Range not satisfiable.
- **417 Expectation Failed**: Expectation failed.
- **418 I'm a teapot**: April Fools' joke (RFC 2324).
- **421 Misdirected Request**: Request sent to wrong server.
- **422 Unprocessable Entity**: Semantic errors (WebDAV).
- **423 Locked**: Resource locked (WebDAV).
- **424 Failed Dependency**: Failed dependency (WebDAV).
- **425 Too Early**: Too early for processing.
- **426 Upgrade Required**: Upgrade required.
- **428 Precondition Required**: Precondition required.
- **429 Too Many Requests**: Too many requests.
- **431 Request Header Fields Too Large**: Headers too large.
- **451 Unavailable For Legal Reasons**: Legal restrictions.

## 5xx: Server Errors
- **500 Internal Server Error**: Server error.
- **501 Not Implemented**: Not implemented.
- **502 Bad Gateway**: Invalid response from upstream.
- **503 Service Unavailable**: Service unavailable.
- **504 Gateway Timeout**: Upstream server timed out.

