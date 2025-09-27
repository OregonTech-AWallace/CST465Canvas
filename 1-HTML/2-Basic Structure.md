# Basic HTML Structure

## The Document Type Definition (DTD)
The document type definition is the first line of any HTML document. It specifies the type of document, or more specifically the ruleset by which the document will be parsed/rendered. While the web was still evolving, there were a number of different versions/variations, each with pretty significant differences in what was allowable. Today, there is one standard for use across the web, and that is HTML 5.

```
<!DOCTYPE html>
```

Although this is the only one you would use at this time, the Document Type Definition is still a required part of every valid HTML document.

## The root element
Valid XML documents must have a root element, that is, an element that encloses all other elements in the document. For HTML, the root element is simply named html.

```
<html lang="en-us"></html>
```

Notice that the "lang" attribute is also specified. This is short for "language" and is required as part of the HTML 5 specification in order to inform clients what language/dialect the document is written in. This helps aid in properly translating documents to other languages.

## Head `<head></head>`
Not to be confused with a "heading" or "header", the head contains metadata about the document, or in other words, items that are important to describe the page and its behavior, but not actually part of the document content. This includes data such as the document title, description, references to resources such as external JavaScript/CSS files and special descriptors to identify the document to social media.

## Title `<title></title>`
The title belongs in the document head, but deserves a special callout because it is **required** for the document to be considered valid

## Body `<body></body>`
The body is the location to place all document content.

## The Simplest Valid HTML Document
```
<!DOCTYPE html>
<html lang="en-us">
<head>
    <title>Simple HTML Document</title>
</head>
<body>
    
</body>
</html>
```

## One Last Thing
While not technically required, all documents **should** have a top level heading element, `<h1></h1>` which contains similar content to the document title.