#CUNYfirst-pAPI

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

Asking for an element that does not exist will result in a 404 error:
~~~
{
message: "Resource not found"
}
~~~

#TODO

[ ]  Add actual data from CUNYfirst database

[X]  Add tests

[ ]  Add query parameters
-  [X] "?start_after=0:900"
-  [X] "?end_before=0:900"
-  [X] "?start_before=0:900"
-  [X] "?end_before=0:900"
-  [ ] "?department_name=CSCI"

[ ]  Add pagination (so you can specify "I just want the first 30 courses")


[ ]  Change field names and resource names so they match those used by CUNYfirst database

[X]  Add error message if no resources returned

#Tips
The data from these URLs is in [JSON](http://en.wikipedia.org/wiki/JSON) format.  In order to make it easier to read in the browser you might want to download a plugin.  If you're using the Chrome browser, try [JSONView](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc/related?hl=en).

##Using the API

###cURL

If you're on a *nix machine, say OS X, you can use the command line utility cURL to test what you're getting from the API.

On the command line enter

~~~
curl "http://calm-falls-3644.herokuapp.com/sections?course_id=4"
~~~

You should get back

~~~
[{"id":7,"days":"TTH","start_time":"2000-01-01T20:30:00.000Z","end_time":"2000-01-01T21:20:00.000Z","cfid":"46015","course_id":4,"created_at":"2014-09-24T08:00:55.573Z","updated_at":"2014-09-24T08:00:55.573Z"},{"id":8,"days":"TTH","start_time":"2000-01-01T19:30:00.000Z","end_time":"2000-01-01T20:20:00.000Z","cfid":"46014","course_id":4,"created_at":"2014-09-24T08:00:55.581Z","updated_at":"2014-09-24T08:00:55.581Z"},{"id":9,"days":"TTH","start_time":"2000-01-01T18:30:00.000Z","end_time":"2000-01-01T19:20:00.000Z","cfid":"46016","course_id":4,"created_at":"2014-09-24T08:00:55.589Z","updated_at":"2014-09-24T08:00:55.589Z"}]
~~~
