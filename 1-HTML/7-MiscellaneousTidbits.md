# Miscellaneous Tidbits
## Whitespace
In HTML, white space is ignored except for single spaces as part of content.  New lines would even be treated as single spaces in content.
These three code blocks render exactly the same thing:
```
<body>
I have a dog
</body>
```
```
<body>
I     have     a     dog
</body>
```
```
<body>
I
have
a
dog
</body>
```

## Comments

Comments in HTML follow the same format as XML:
```
<body>
<!--  This is a comment, only visible in the source  -->
<p>This text is visible</p>
</body>
```

It is important to note that a comment in an HTML file will still be transmitted to the browser and could be inspected by anyone viewing the page.

## Special Characters/Escape Codes
Escape codes are used to display characters that either have special meaning in HTML, or are otherwise difficult to use because they do not exist on the keyboard.

An example of a character with special meaning is the angle bracket, `<` and `>`.  HTML parsers will try to interpret them as part of a tag.

You can specify which character to display in two ways.
`&code;` - where code is the predefined character code (ie. gt: >, lt: <, copy: ©)
`&#value;` - where value is the numeric ASCII value of the character

For example, if you created a page where you were trying to teach someone about HTML, you couldn't simply put a string like 
`<strong>Strong Text</strong>`
or it would look like
**Strong Text**

Instead, you would escape the angle brackets like:
`&lt;strong&gt;Strong Text&lt;/strong&gt;`

Unicode characters can also be escaped.

There is a pretty nice, and very thorough list of escape codes at [https://mottie.github.io/Unicode/index.html](https://mottie.github.io/Unicode/index.html)