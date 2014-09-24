#CUNYfirst-pAPI

###Built with love by Queens College CSCI 370, Group C

This "pseudo-API" is being built with [Rails::API](https://github.com/rails-api/rails-api) to provide easier access to CUNYfirst course registration data using a JSON RESTful API.  It is currently filled with a small amount of seed data pulled from off the internet.  In time it will be filled with data parsed from the actual CUNYfirst database.

The current proof-of-concept is being hosted at on heroku.

Thus far the Institutions, Departments, Courses, and Sections resources have been created.  They can be accessed at these endpoints:
-  http://calm-falls-3644.herokuapp.com/institutions
-  http://calm-falls-3644.herokuapp.com/departments
-  http://calm-falls-3644.herokuapp.com/courses
-  http://calm-falls-3644.herokuapp.com/sections

for their respective collection views and 
-  http://calm-falls-3644.herokuapp.com/institutions/1
-  http://calm-falls-3644.herokuapp.com/departments/1
-  http://calm-falls-3644.herokuapp.com/courses/1
-  http://calm-falls-3644.herokuapp.com/sections/1

for elements within the collection (replace "1" with the element-id of your choice).

To search sections by course id, use
-  http://calm-falls-3644.herokuapp.com/sections?course_id=4

(replace "4" with the course-id of your choice).

#TODO

[ ]  Add tests

[ ]  Add query parameters (e.g. "?start_time=9:00" or "?department=CSCI")

[ ]  Add pagination (so you can specify "I just want the first 30 courses")

[ ]  Add actual data from CUNYfirst database

[ ]  Change field names and resource names so they match those used by CUNYfirst database

[ ]  Add error message if no resources returned

#Tips
The data from these URLs is in [JSON](http://en.wikipedia.org/wiki/JSON) format.  In order to make it easier to read in the browser you might want to download a plugin.  If you're using the Chrome browser, try [JSONView](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc/related?hl=en).
