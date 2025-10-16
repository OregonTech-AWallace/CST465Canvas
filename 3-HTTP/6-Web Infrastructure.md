# Web Infrastructure
## Proxy Servers
Up through high school, many of you probably dealt with proxy servers.  These were the very restrictive servers that blocked you from browsing to anything but approved locations on the internet.  These are not a part of web server infrastructure, but are simply mentioned because it is a concept you are likely very familiar with.

![Proxy Server Diagram](../Images/ProxyServer.jpg)

## Reverse-proxy Servers
On the Internet today, you will almost always be dealing with reverse-proxy servers to access websites.  Let's look at the diagram first.

![Reverse-Proxy Server Diagram](../Images/ReverseProxyServer.jpg)

As you can see, the idea is very similar to that of a proxy server, except the clients are now coming from the internet.  The reverse-proxy server takes requests and decides where to (and whether to) route them to internal applications.  Instead of protecting our internal clients from the outside Internet, we are now protecting our internal infrastructure from external clients.  

The **web servers** we looked at on the the previous page, while capable of serving content on their own, are also frequently used as reverse-proxy servers.  The **application server** may live on the same host as the web server, or a different host depending on the needs.

## Other Web Infrastructure



### Caching-proxy
Caching proxies are a special kind of reverse-proxy that require a callout.  While most reverse-proxies are capable of caching data, a caching proxy is built with that sole purpose in mind.  A caching proxy will sit in front of the web server or reverse-proxy.  On the first request to a resource, the caching proxy will make a call to its backend, the web server/reverse-proxy.  When it gets a response, it will look at the cache-control header and, if allowed, store a copy of the response content.  The next time a request comes in, assuming the caching duration has not expired, it will serve directly from its local copy.  When placed in front of dynamic website, it will allow it to respond with the speed of a static website.  **Varnish** is an open-source software that is basically synonymous with the term "caching proxy".

#### Won't that mean my site isn't as dynamic anymore?
Yes, but often that's okay.  A caching proxy can be given directives about how and what to cache.  For example, if you know that you are varying content based on geographic location, you can tell the caching proxy to cache/serve multiple versions of the web page depending on that criteria.   Pages such as those containing your account balance on a banking site will either not cache the page, or cache the page, but use JavaScript to dynamically load the non-static components.

![How varnish works](../Images/varnish.jpg)

### Load-balancers/SSL Offloading
A load-balancer is a service, often running on a hardware appliance, that sits in front of a pool of other servers.  It is the front line of routing traffic for a highly-scalable website.  One of the most important functions it performs is **SSL Offloading**.  Browsers have begun to enforce the usage of HTTPS for web traffic to ensure that data cannot be intercepted, but it comes at a cost.  The handshaking and encrypting/decrypting of traffic requires a lot of compute cycles.  Load-balancers often handle this task and then send traffic internally via HTTP to backend infrastructure to ensure that web/application servers can focus on their primary purpose.

![Load balancer in front of back-end infrastructure](../Images/LoadBalancer.png)


### Content Delivery Network (CDN)
If you thought the idea of a caching proxy was cool, you ain't seen nothing yet.  A content delivery network is like a whole fleet of caching proxies.  With a CDN, there are numerous "nodes" or **edge servers** distributed throughout the world.  These **edge servers** will pull content from the **origin**.  **Origin** is a fancy word for the web server which hosts the authoritative version of the content.

![Content Delivery Network diagram](../Images/cdn.jpg)

#### How does it know which node to use?
Here's a simplified description of the process
1. A web browser attempts to access a resource, for example cdn.jsdelivr.net
1. The client machine sends a DNS lookup request for cdn.jsdelivr.net
1. The DNS server inspects the IP address of the client machine
1. The DNS server determines the closest node to the client responds with the appropriate IP address
1. The web browser connects to the IP address returned

 The majority of websites on the Internet today are utilizing Content Delivery Networks for at least some of their resources.