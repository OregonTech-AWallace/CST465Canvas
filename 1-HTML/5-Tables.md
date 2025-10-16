# Tables
- Tables are intended to display tabular data, or data that is related.
- In the past, tables were commonly used to create page layouts because they were displayed almost identically between browsers
- With current browser functionality this is no longer necessary, and you should NEVER use tables to control layout.   

**Furthermore, if you turn in an assignment that uses tables for page layout, I will deduct points and ask that you redo the assignment.**

## Example of Table Usage

Here is an example of a table displaying tabular data:

```html
<table>
    <thead>
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Age</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>John</td>
            <td>Doe</td>
            <td>25</td>
        </tr>
        <tr>
            <td>Jane</td>
            <td>Smith</td>
            <td>30</td>
        </tr>
    </tbody>
</table>
```

This table includes a header row (`<thead>`) and a body section (`<tbody>`), which is the recommended structure for accessibility and clarity.

### Rendered Output of the Table

| First Name | Last Name | Age |
|------------|-----------|-----|
| John       | Doe       | 25  |
| Jane       | Smith     | 30  |


## Improper Use of Tables
Here are a few examples of improper table usage that I have commonly seen

### Grouping Unrelated Data
As mentioned previously, it is a common to want to use a table to make things look a certain way.  
Here's a section from the Syllabus  
```
Instructor:     Alan Wallace            541-885-1715     alan.wallace@oit.edu
Office Hours:   By Appointment Only
```

While this certainly looks like a table based on the way it's formatted, you must remember to ask yourself, is this data related?  If you look at the columns, could you put a heading above "Alan Wallace" and "By Appointment Only" and have it make sense?  If the answer is no, then it shouldn't be a table.

### Not Using `<thead>` and `<tbody>`
While it is not a requirement to use `<thead>` and `<tbody>`, it is considered good practice.  It helps machines better understand what part of the table is labeling the columns.  There is also a `<tfoot>` element that should be used if there is a footer on the table for purposes such as defining annotations, or providing aggregated data, such as column sums.
```html
<table>
    <thead>
        <th>Year</th>
        <th>Course</th>
        <th>Instructor</th>
        <th># Students</th>
    </thead>
    <tbody>
        <tr>
            <td>2023</td>
            <td>Web Development</td>
            <td>Alan Wallace</td>
            <td>15</td>
        </tr>
        <tr>
            <td>2024</td>
            <td>Web Development</td>
            <td>Alan Wallace</td>
            <td>14</td>
        </tr>
        <tr>
            <td>2025</td>
            <td>Web Development</td>
            <td>Alan Wallace</td>
            <td>16</td>
        </tr>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="3">Total Students</td>
            <td>45</td>
        </tr>
    </tfoot>
</table>
```
| Year | Course | Instructor | # Students |
|---|---|---|---|
|2023 | Web Development | Alan Wallace | 15 |
|2024 | Web Development | Alan Wallace | 14 |
|2025 | Web Development | Alan Wallace | 16 |
|<td colspan=2>Total Students | 45 |

### Not Putting Related Data in the Same Table
While this could end up looking the same as having a single table, it ruins the meaning of the data because it is no longer seen as the same dataset.

```html
<table>
    <thead>
        <tr>
            <th>Title</th>
            <th>Author</th>
            <th>ISBN</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Book 1</td>
            <td>John Doe</td>
            <td>123-123-123</td>
        </tr>
    </tbody>
</table>
<table>
    <tbody>
        <tr>
            <td>Book 2</td>
            <td>Jane Doe</td>
            <td>456-456-456</td>
        </tr>
    </tbody>
</table>
```
DO THIS INSTEAD
```html
<table>
    <thead>
        <tr>
            <th>Title</th>
            <th>Author</th>
            <th>ISBN</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Book 1</td>
            <td>John Doe</td>
            <td>123-123-123</td>
        </tr>
        <tr>
            <td>Book 2</td>
            <td>Jane Doe</td>
            <td>456-456-456</td>
        </tr>
    </tbody>
</table>
```