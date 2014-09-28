#CUNYfirst-pAPI

This "pseudo-API" is being built with [Rails::API](https://github.com/rails-api/rails-api) to provide easier access to CUNYfirst course registration data using a JSON RESTful API.  It is currently filled with a small amount of seed data pulled from off the internet.  In time it will be filled with data parsed from the actual CUNYfirst database.

The current proof-of-concept is being hosted at on heroku.

Thus far the Institutions, Departments, Courses, Sections, Locations, Instructors, and Semesters resources have been created.  They can be accessed at these endpoints:
-  http://calm-falls-3644.herokuapp.com/institutions
-  http://calm-falls-3644.herokuapp.com/departments
-  http://calm-falls-3644.herokuapp.com/courses
-  http://calm-falls-3644.herokuapp.com/sections
-  http://calm-falls-3644.herokuapp.com/instructors
-  http://calm-falls-3644.herokuapp.com/locations
-  http://calm-falls-3644.herokuapp.com/semesters

for their respective collection views and 
-  http://calm-falls-3644.herokuapp.com/institutions/1
-  http://calm-falls-3644.herokuapp.com/departments/1
-  http://calm-falls-3644.herokuapp.com/courses/1
-  http://calm-falls-3644.herokuapp.com/sections/1
-  http://calm-falls-3644.herokuapp.com/instructors/1
-  http://calm-falls-3644.herokuapp.com/locations/1
-  http://calm-falls-3644.herokuapp.com/semesters/1


for elements within the collection (replace "1" with the element-id of your choice).

##Sections Query API

Sometimes you want to narrow down your request.  Maybe instead of getting all the sections, you just want the ones that start after 9:00 AM.  In that case, use http://calm-falls-3644.herokuapp.com/sections?start_after=4 .

Notice it's just the the "sections" resource URL with a question mark and assertion (in this case, start_after=4).

You can search with multiple parameters by seperating them with an ampersand:
-  http://calm-falls-3644.herokuapp.com/sections?start_after=09:00&course_id=4&end_before=20:00
(sections that start afer 9:00 AM and end before 8:00 PM and are associated with course_id #4)

The query parameters defined so far for the Section resource are (notice how all times must be in HH:MM format):

-  start_before  (e.g. http://calm-falls-3644.herokuapp.com/sections?start_before=09:00)
-  start_after  (e.g. http://calm-falls-3644.herokuapp.com/sections?start_after=09:00)
-  end_before  (e.g. http://calm-falls-3644.herokuapp.com/sections?end_before=09:00)
-  end_after  (e.g. http://calm-falls-3644.herokuapp.com/sections?end_after=09:00)
-  course_id (e.g. http://calm-falls-3644.herokuapp.com/sections?course_id=4)
-  location_id (e.g. http://calm-falls-3644.herokuapp.com/sections?location_id=4)
-  instructor_id (e.g. http://calm-falls-3644.herokuapp.com/sections?instructor_id=4)
-  semester_id (e.g. http://calm-falls-3644.herokuapp.com/sections?semester_id=1)
-  open (e.g. http://calm-falls-3644.herokuapp.com/sections?open=true)
-  closed (e.g. http://calm-falls-3644.herokuapp.com/sections?closed=true)

Asking for an element that does not exist will result in a 404 error:
~~~
{
message: "Resource not found"
}
~~~

#TODO

-  [ ]  Add actual data from CUNYfirst database

-  [X]  Add tests

-  [X]  Add ability to query with multiple parameters

-  [ ]  Add pagination (so you can specify "I just want the first 30 courses")

-  [ ]  Change field names and resource names so they match those used by CUNYfirst database

-  [X]  Add error message if no resources returned


###Add query parameters
-  [X] "/sections?start_after=09:00"
-  [X] "/sections?end_before=09:00"
-  [X] "/sections?start_before=09:00"
-  [X] "/sections?end_before=09:00"
-  [ ] "/sections?department_name=CSCI"


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
