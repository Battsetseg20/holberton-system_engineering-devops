# 0x15. API


* *What is an API*
An application program interface (API) is a set of routines, protocols, and tools for building software applications. It can be a piece of software with a disctinct function or the whole server (the whole app), or just small part of an app that can be distinctively separated from its environment.  Basically, an API specifies how software components should interact. Additionally, APIs are used when programming graphical user interface (GUI) components.


*API use:*
 The idea is to have your website’s server talk directly to Google’s server with a request to create an event with the given details. Your server would then receive Google’s response, process it, and send back relevant information to the browser, such as a confirmation message to the user.

Alternatively, your browser can often send an API request directly to Google’s server bypassing your server.How is this Google Calendar’s API different from the API of any other remote server out there? In technical terms, the difference is the format of the request and the response. To render the whole web page, your browser expects a response in HTML, which contains presentational code, while Google Calendar’s API call would just return the data — likely in a format like JSON.

When a company offers an API to their customers, it just means that they’ve built a set of dedicated URLs that return pure data responses — meaning the responses won’t contain the kind of presentational overhead that you would expect in a graphical user interface like a website.

* *What is a REST API*
 Representational State Transfer (REST) is a way for two computer systems to communicate over HTTP in a similar way to web browsers and servers. More on:
https://www.sitepoint.com/rest-api/

* *What are microservices*
It’s not uncommon for development teams to break up their application into multiple servers that talk to each other via APIs. The servers that perform helper functions for the main application server are commonly referred to as microservices. More on:
https://smartbear.com/solutions/microservices/

* *What is the CSV format*
CSV, or Comma-separated Values, is an extremely common flat-file format that uses commas as a delimiter between values. Anyone familiar with spreadsheet programs has very likely encountered CSV files before - they’re easily consumed by Google Spreadsheet, Microsoft Excel, and countless other applications.
```
name,date,count,description,replaces_product,approved
"Inflatable Elephant, African", 2013-09-23,5,"Found in Africa.
They live in dense forests, mopane and miombo woodlands, Sahelian scrub or deserts.",null,true
Large Mouse,2013-08-19,3,"A ""largish"" mouse",General Mouse,false
```

* *What is the JSON format*
JSON (JavaScript Object Notation) is our most commonly used format. JSON is a text-based open standard derived from the format used to represent simple data structures in JavaScript. Although it is rooted in JavaScript, it is language-agnostic and parsers exist for all popular (and many unpopular) languages.
```
[ {
  "position" : "Member",
  "agency_website" : "SSAB (https://www.ssab.gov)",
  "name" : "Aaron, Henry Jacob",
  "nomination_date" : "2011-02-14T00:00:00.000",
  "agency_name" : "Social Security Advisory Board"
}, {
  "position" : "Member",
  "confirmed" : true,
  "agency_website" : "EOP-CEA (https://www.whitehouse.gov/administration/eop/cea)",
  "name" : "Abraham, Katharine",
  "confirmation_vote" : "2011-04-14T00:00:00.000",
  "nomination_date" : "2011-01-26T00:00:00.000",
  "agency_name" : "Council of Economic Advisers"
} ]
```
* *Python pep8 styling*

  - Pythonic Package and module name style
  Modules should have short, all-lowercase names. Underscores can be used in the module name if it improves readability.
  - Pythonic Class name style
  Class names should normally use the CapWords convention.
  - Pythonic Variable name style
   Use CapWords preferring short names: T, AnyStr, Num.
  - Pythonic Function name style
  Function names should be lowercase, with words separated by underscores as necessary to improve readability.
  - Pythonic Constant name style
  Constants are usually defined on a module level and written in all capital letters with underscores separating words. Examples include MAX_OVERFLOW and TOTAL.


# Ressources
https://www.freecodecamp.org/news/what-is-an-api-in-english-please-b880a3214a82/

https://www.webopedia.com/definitions/api/

https://www.sitepoint.com/rest-api/

https://developers.digitalocean.com/documentation/v2/

https://docs.python.org/3/library/csv.html

https://fr.python-requests.org/en/latest/

https://jsonplaceholder.typicode.com/todos/?userId=1

https://jsonplaceholder.typicode.com/users/2