
Section.delete_all
Course.delete_all
Department.delete_all
Institution.delete_all
Instructors.delete_all
Locations.delete_all
Semesters.delete_all

school_names = ["Baruch College", "Brooklyn College", "The City College of New York", "College of Staten Island", "Hunter College", "John Jay College of Criminal Justice", "Lehman College", "Medgar Evers College", "New York City College of Technology", "Queens College", "York College"]


school_names.each do |school| 
  inst = Institution.new(name: school)
  inst.save
end

qc = Institution.find_by_name("Queens College")


csdepartment = Department.new(name:"CSCI")
csdepartment.institution = qc
csdepartment.save
mathdepartment = Department.new(name:"MATH")
mathdepartment.institution = qc
mathdepartment.save


qc_cs_courses.each do |course| 
  crs = Course.new(name: course[0])
  crs.cfid = course[1]
  crs.department = csdepartment
  crs.save
end

intro_cs_sections = [["44587", "MW", "11:10", "12:00"],
["44588", "TF", "08:00", "08:50"],
["45321", "TF", "09:00", "09:50"],
["46090", "TF", "10:05", "10:55"],
["46091", "TF", "11:10", "12:00"],
["46092", "MW", "08:00", "08:50"]]

intro_cs_course = Course.find_by_name("INTRO COMPUTERS & CO")

intro_cs_sections.each do |section| 
  sec = Section.new()
  sec.cfid = section[0]
  sec.days = section[1]
  sec.start_time = section[2]
  sec.end_time = section[3]
  sec.course = intro_cs_course
  sec.save
end

spreadsheet_cs_sections = [["46015", "TTH", "20:30", "21:20"],
["46014", "TTH", "19:30", "20:20"],
["46016", "TTH", "18:30", "19:20"]]

spreadsheet_cs_course = Course.find_by_name("SPEADSHEET PROGRAMMI")

spreadsheet_cs_sections.each do |section| 
  sec = Section.new()
  sec.cfid = section[0]
  sec.days = section[1]
  sec.start_time = section[2]
  sec.end_time = section[3]
  sec.course = spreadsheet_cs_course
  sec.save
end
