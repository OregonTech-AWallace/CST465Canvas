# The CSS Box Model
Every visible element on the page is treated as a rectangular box.  The CSS box model describes how elements are rendered and spaced. Each box consists of four components:

**Content:** The actual text or image.

**Padding:** Space between the content and the border.

**Border:** The line surrounding the padding and content.

**Margin:** Space outside the border, separating the element from others.

Understanding the box model is crucial for designing page layout.

## Margin Collapsing
Margin collapsing can come as a shock if you are not expecting it.  Margin collapsing only applies to vertical (top/bottom) margins and is a behavior where the margins overlap each other.  For example, if an element has a 30 pixel bottom margin, and the element below it has a 10 pixel top margin, there will not be a 40 pixel space between them.  Rather, there will only be a 30 pixel space because the 10 pixel margin is overlapped with the 30 pixel margin

## Changing the Computation
Trying to keep track of the size of your boxes can be difficult.  A style was introduced which changes this behavior and makes it a little simpler.  This style is **box-sizing**.  The default behavior, which was previously explained is the setting:
` box-sizing: content-box; `
Another possible value is:
` box-sizing: border-box; `
The difference her is that the computation of box size changes from
margin + border + padding + content
to
margin + content
The border and padding push the content inside of the box instead of adding to the outside of it.