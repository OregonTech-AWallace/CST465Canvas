# HTML and CSS File Size Efficiency
We just looked at some examples of how CSS can be written in a shorter manner, for example using `margin: 5px;` instead of `margin: 5px 5px 5px 5px;`.  You may wonder why this even matter.  The reason is that every byte of network traffic matters.  By using the shorthand method, we were able to reduce 9 bytes in file size.  For a larger site, it is not uncommon to see the reduction measured in kilobytes.  You may be thinking "This doesn't matter anymore because I've got blazingly fast internet".  

While this may be true for you, here are some reasons why that line of thinking is incorrect:
- There are still very rural parts of the world that are just now getting connected and experiencing internet speeds that many of us had 20 years ago.  
- The web is increasingly browsed from mobile phones, and is the only source of internet access for many.  Cellular service can be slow/spotty depending on where you are
- With users expecting websites to load fast, a few milliseconds can sometimes make the difference in whether they stay on your site or move on
- Many hosting providers charge based on network traffic.  If we look at this at even a small scale, the difference is not insignificant.
    - 2k reduction in file size, 500,000 page views a month, is about a 1GB reduction in total traffic. 


## Minification
While we won't cover this in-depth in this class, I just wanted to raise awareness that there are a number of tools available that can process your HTML/CSS files before you publish them to a live site.  These tools will "minify" your files, which is to say that they will remove all unnecessary whitespace, units next to 0 values, convert colors and box size values to shorthand where applicable, remove identical styles, etc.  These tools can drastically reduce the total size of your site, but are typically only used prior to deployment because the output is very difficult for humans to read. 