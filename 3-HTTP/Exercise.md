# Exercise 3
It's time to get familiar with HTTP requests, and not just with the browser.  
- Create a Word Document named Exercise3.docx.  
- Answer the questions below in the Word Document
- Submit the Word Document to Canvas

## Prerequisites
In order to complete these exercises, you will first need to download a tool which allows for sending custom HTTP requests.  The following two are my favorites:

**Bruno** https://www.usebruno.com

**Postman** https://www.postman.com

These tools are incredibly powerful and are commonly used for troubleshooting web sites and APIs.  We will only be using some of the most basic functionality at this time.

## Getting Started
Both of these tools work similarly.  Both support the idea of "collections", which is a grouping of requests.  Although there are some differences in their concept of collections, it won't be of concern to us here.  It may make sense to call the collection CST465_Exercise3, but you can call it whatever you want as I won't be looking at this.

## Making Advanced Requests
Create a new request in your collection for each of the following items.  After creating (AND SAVING) the first one, you can actually right-click it and duplicate it to make it a little easier.

### Request 1 
<pre>
<b>URL</b>: https://otapp-cstwebdev.azurewebsites.net/exercise3  
<b>Method</b>: GET
</pre>
Use the Send button/arrow to execute the request

Verify that you are getting some very plain content back

#### Question 1: What software does the server say it is using?

### Request 2
<pre>
<b>URL</b>: https://otapp-cstwebdev.azurewebsites.net/exercise3  
<b>Method</b>: GET  
<b>Headers</b>  
Person: [any name]
</pre>
Replace [any name] with a persons name

#### Question 2: What is the value of the content-type header returned from the server?
### Request 3
<pre>
<b>URL</b>: https://otapp-cstwebdev.azurewebsites.net/exercise3  
<b>Method</b>: GET  
<b>Headers</b>  
Person: [any name]
Accept: application/json
</pre>
Replace [any name] with a persons name


#### Question 3: What is the value of the content-type header now?  

### Request 4
<pre>
<b>URL</b>: https://otapp-cstwebdev.azurewebsites.net/exercise3  
<b>Method</b>: GET  
<b>Headers</b>  
Person: [any name]
Accept: application/xml
</pre>
Replace [any name] with a persons name

#### Question 4: What do you notice about the output?

### Request 5
<pre>
<b>URL</b>: https://otapp-cstwebdev.azurewebsites.net/exercise3  
<b>Method</b>: POST  
<b>Headers</b>  
Accept: application/xml
Content-Type: application/json
<b>Body(set type as JSON)</b>
{
    "Name": "[any name]",
    "FavoriteColor": "Blue"
}
</pre>
Replace [any name] with a persons name

#### Question 5: What is the difference in purpose between the Accept and Content-Type headers?



### Request 6
<pre>
<b>URL</b>: https://otapp-cstwebdev.azurewebsites.net/exercise3/nom
<b>Method</b>: GET  
</pre>
#### Question 6: What software does the server say it is running now?  Do you think it is truthful?  Why or why not?

Copy the URL for this request into a web browser and load it. Then, right-click on the page and go to Inspect, and change to the "Application" tab. Look in the Cookies section and notice that your browser is storing a value.

### Request 7
Execute Request 2 Again

#### Question 7: How does the server know about the oreo flavor?