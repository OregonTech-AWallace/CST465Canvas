# Types of Websites
## Static Websites
Static websites consist of fixed content that is delivered to the user exactly as stored. These websites are typically built using HTML, CSS, and sometimes JavaScript, and do not require server-side processing. 
### Benefits
- Fast
- Secure
- Easy to host
- Inexpensive to serve large volumes of traffic

### Drawbacks
- No real-time data/integrations

### Examples of Static Websites
- Small business websites
- Portfolio websites
- Documentation websites
- Blogs without dynamic content (e.g. each post is a static page)

## Dynamic Websites
Dynamic websites generate content dynamically based on factors like user interaction, data, time, permissions, geographic location, or other variables. While JavaScript can be used in a static website to give the appearance of dynamic behavior, true dynamic websites involve server-side processing or advanced client-side frameworks.

### Types of Dynamic Websites
**Dynamic Server-side Rendering of HTML**  
    Content is generated on the server and sent to the client as fully rendered HTML. This is the primary methodology of technologies like ASP.NET / PHP / Django

**Static Client HTML with Server-side Calls**  
    Static HTML pages are served to the client, but JavaScript is utilized for fetching dynamic data via API calls. 

**Single Page Application (SPA)**  
    SPAs load a single HTML page and dynamically update the content. JavaScript frameworks like React, Angular, and Vue.js are the most popular for building these types of applications, but there are **MANY** to choose from.

**Progressive Web Applications (PWA)**  
    PWAs combine the best of web and mobile apps.  They can be accessed via a standard web-browser, or installed to a device to offer offline capabilities, push notifications, and native app-like experiences.

### Examples of Dynamic Websites
- E-commerce sites like Amazon
- Streaming sites like Netflix
- Social media sites like Instagram

### Benefits
- Greater flexibility and interactivity
- Ability to provide different experiences for different audiences
- Can integrate real-time data from a vast array of data sources
- Can integrate with third-party services for enhanced functionality

### Drawbacks
- Requires more resources to develop and maintain
- Higher hosting costs
- More points of failure