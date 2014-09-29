#CUNYfirst-pAPI

This "pseudo-API" is being built with [Rails::API](https://github.com/rails-api/rails-api) to provide easier access to CUNYfirst course registration data using a JSON RESTful API.  It is currently filled with a small amount of seed data pulled from off the internet.  In time it will be filled with data parsed from the actual CUNYfirst database.

The current proof-of-concept is being hosted at on heroku.

Thus far the Institutions, Departments, Courses, Sections, Locations, Instructors, and Semesters resources have been created.  They can be accessed at these endpoints:
-  http://cuny-first-papi.herokuapp.com/institutions
-  http://cuny-first-papi.herokuapp.com/departments
-  http://cuny-first-papi.herokuapp.com/courses
-  http://cuny-first-papi.herokuapp.com/sections
-  http://cuny-first-papi.herokuapp.com/instructors
-  http://cuny-first-papi.herokuapp.com/locations
-  http://cuny-first-papi.herokuapp.com/semesters

for their respective collection views and 
-  http://cuny-first-papi.herokuapp.com/institutions/1
-  http://cuny-first-papi.herokuapp.com/departments/1
-  http://cuny-first-papi.herokuapp.com/courses/1
-  http://cuny-first-papi.herokuapp.com/sections/1
-  http://cuny-first-papi.herokuapp.com/instructors/1
-  http://cuny-first-papi.herokuapp.com/locations/1
-  http://cuny-first-papi.herokuapp.com/semesters/1


for elements within the collection (replace "1" with the element-id of your choice).

Asking for an element that does not exist will result in a 404 error:
~~~
{
message: "Resource not found"
}
~~~



##Sections Query API

Sometimes you want to narrow down your request.  Maybe instead of getting all the sections, you just want the ones that start after 9:00 AM.  In that case, use http://cuny-first-papi.herokuapp.com/sections?start_after=4 .

Notice it's just the the "sections" resource URL with a question mark and assertion (in this case, start_after=4).

You can search with multiple parameters by seperating them with an ampersand:
-  http://cuny-first-papi.herokuapp.com/sections?start_after=09:00&course_id=4&end_before=20:00
(sections that start afer 9:00 AM and end before 8:00 PM and are associated with course_id #4)

The query parameters defined so far for the Section resource are (notice how all times must be in HH:MM format):

-  start_before  (e.g. http://cuny-first-papi.herokuapp.com/sections?start_before=09:00)
-  start_after  (e.g. http://cuny-first-papi.herokuapp.com/sections?start_after=09:00)
-  end_before  (e.g. http://cuny-first-papi.herokuapp.com/sections?end_before=09:00)
-  end_after  (e.g. http://cuny-first-papi.herokuapp.com/sections?end_after=09:00)
-  course_id (e.g. http://cuny-first-papi.herokuapp.com/sections?course_id=4)
-  location_id (e.g. http://cuny-first-papi.herokuapp.com/sections?location_id=4)
-  instructor_id (e.g. http://cuny-first-papi.herokuapp.com/sections?instructor_id=4)
-  semester_id (e.g. http://cuny-first-papi.herokuapp.com/sections?semester_id=1)
-  open (e.g. http://cuny-first-papi.herokuapp.com/sections?open=true)
-  closed (e.g. http://cuny-first-papi.herokuapp.com/sections?closed=true)

#TODO

-  [X]  Add actual data from CUNYfirst database

-  [X]  Add tests

-  [X]  Add ability to query with multiple parameters

-  [ ]  Add pagination (so you can specify "I just want the first 30 courses")

-  [ ]  Change field names and resource names so they match those used by CUNYfirst database

-  [X]  Add error message if no resources returned

-  [ ]  Clean up Sections controller filter logic a la http://www.justinweiss.com/blog/2014/02/17/search-and-filter-rails-models-without-bloating-your-controller/


#Tips
The data from these URLs is in [JSON](http://en.wikipedia.org/wiki/JSON) format.  In order to make it easier to read in the browser you might want to download a plugin.  If you're using the Chrome browser, try [JSONView](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc/related?hl=en).

##Using the API

###cURL

If you're on a *nix machine, say OS X, you can use the command line utility cURL to test what you're getting from the API.

On the command line enter

~~~
curl "http://cuny-first-papi.herokuapp.com/sections?course_id=4"
~~~

You should get back something like

~~~
[  {"id":24,"days":"M, W","start_time":"18:55","end_time":"18:35","cfid":"51362","course_id":4,"created_at":"2014-09-29T08:51:07.386Z","updated_at":"2014-09-29T08:51:07.392Z","current_enrollment":58,"enrollment_limit":57,"location_id":10,"instructor_id":16,"semester_id":1,"mode_of_instruction":"In-Person"},

{"id":25,"days":"T, TH","start_time":"18:55","end_time":"18:35","cfid":"51370","course_id":4,"created_at":"2014-09-29T08:51:07.414Z","updated_at":"2014-09-29T08:51:07.420Z","current_enrollment":57,"enrollment_limit":57,"location_id":10,"instructor_id":17,"semester_id":1,"mode_of_instruction":"In-Person"},

{"id":26,"days":null,"start_time":null,"end_time":null,"cfid":"51374","course_id":4,"created_at":"2014-09-29T08:51:07.446Z","updated_at":"2014-09-29T08:51:07.446Z","current_enrollment":null,"enrollment_limit":null,"location_id":null,"instructor_id":null,"semester_id":null,"mode_of_instruction":null},

{"id":27,"days":null,"start_time":null,"end_time":null,"cfid":"47394","course_id":4,"created_at":"2014-09-29T08:51:07.468Z","updated_at":"2014-09-29T08:51:07.468Z","current_enrollment":null,"enrollment_limit":null,"location_id":null,"instructor_id":null,"semester_id":null,"mode_of_instruction":null},

{"id":28,"days":"T, TH","start_time":"14:15","end_time":"14:05","cfid":"47424","course_id":4,"created_at":"2014-09-29T08:51:07.490Z","updated_at":"2014-09-29T08:51:07.495Z","current_enrollment":57,"enrollment_limit":57,"location_id":10,"instructor_id":20,"semester_id":1,"mode_of_instruction":"In-Person"},

{"id":29,"days":"T, TH","start_time":"17:00","end_time":"17:40","cfid":"47427","course_id":4,"created_at":"2014-09-29T08:51:07.511Z","updated_at":"2014-09-29T08:51:07.517Z","current_enrollment":57,"enrollment_limit":57,"location_id":10,"instructor_id":20,"semester_id":1,"mode_of_instruction":"In-Person"},

{"id":30,"days":"M, W","start_time":"14:15","end_time":"14:05","cfid":"47458","course_id":4,"created_at":"2014-09-29T08:51:07.538Z","updated_at":"2014-09-29T08:51:07.543Z","current_enrollment":32,"enrollment_limit":32,"location_id":7,"instructor_id":21,"semester_id":1,"mode_of_instruction":"In-Person"}  ]
~~~
