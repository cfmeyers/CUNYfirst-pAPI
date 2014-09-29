
require 'csv'

Section.delete_all
Course.delete_all
Department.delete_all
Institution.delete_all
Instructor.delete_all
Location.delete_all
Semester.delete_all

school_names = ["Baruch College", "Brooklyn College", "The City College of New York", "College of Staten Island", "Hunter College", "John Jay College of Criminal Justice", "Lehman College", "Medgar Evers College", "New York City College of Technology", "Queens College", "York College"]


school_names.each do |school| 
  inst = Institution.new(name: school)
  inst.save
end

qc = Institution.find_by_name("Queens College")

qc_department_names = [
["ACCT", "Accounting"],
["ACE", "Adult Collegiate Education"], 
["AFST", "Africana Studies"],
["AMST", "American Studies"],
["ANTH", "Anthropology"],
["ARTH", "Art History"],
["ARTS", "Art Studio"],
["ASTR", "Astronomy"],
["BASS", "Bachelor&#39;s in Applied Social Science"],
["BIOCH", "Biochemistry"],
["BIOL", "Biology"],
["BALA", "Business &amp; Liberal Arts"],
["GRKST", "Byzantine &amp; Modern Greek Studies"],
["ARAB", "CMAL - Arabic"],
["CHIN", "CMAL - Chinese"],
["CLAS", "CMAL - Classics"],
["EAST", "CMAL - East Asian Studies"],
["GREEK", "CMAL - Greek"],
["HEBRW", "CMAL - Hebrew"],
["JPNS", "CMAL - Japanese"],
["KOR", "CMAL - Korean"],
["LATIN", "CMAL - Latin"],
["MES", "CMAL - Middle Eastern Studies"],
["YIDD", "CMAL - Yiddish"],
["CUNBA", "CUNY BA"],
["CERT", "Certificate"],
["CHEM", "Chemistry"],
["CMAL", "Classical, Mideast &amp; Asian Langs-Program-Wide"],
["CESL", "College English as a Second Language"],
["CMLIT", "Comparative Literature"],
["CSCI", "Computer Science"],
["CO-OP", "Cooperative Education"],
["DANCE", "Dance"],
["DRAM", "Drama"],
["BUS", "ECON - Business"],
["ECON", "ECON - Economics"],
["RM", "ECON - Risk Management"],
["ECPCE", "ECP - Counselor Education"],
["ECPEL", "ECP - Educational Leadership"],
["ECPSP", "ECP - School Psychology"],
["ECPSE", "ECP - Special Education"],
["EURO", "ELL - European Studies"],
["FREN", "ELL - French"],
["GERM", "ELL - German"],
["ITAL", "ELL - Italian"],
["GRKMD", "ELL - Modern Greek"],
["RUSS", "ELL - Russian"],
["ECP", "Education &amp; Community Programs-Program-wide"],
["EECE", "Elementary &amp; Early Childhood Education"],
["ENGL", "English"],
["ELI", "English Language Institute"],
["ENSCI", "Environmental Science"],
["FNES", "Family, Nutrition &amp; Exercise Sciences"],
["GEOL", "Geology"],
["LBSCI", "Graduate School of Library &amp; Information Studies"],
["HIST", "History"],
["HNRS", "Honors (Macaulay)"],
["HTH", "Honors in the Humanities"],
["HMNS", "Honors in the Mathematical &amp; Natural Sciences"],
["HSS", "Honors in the Social Sciences"],
["IRST", "Irish Studies"],
["ITAST", "Italian-American Studies"],
["JAZZ", "Jazz"],
["JEWST", "Jewish Studies"],
["JOURN", "Journalism"],
["LABST", "Labor Studies"],
["LBLST", "Liberal Studies"],
["LIBR", "Library"],
["LCD", "Linguistics &amp; Communication Disorders"],
["MAM", "Maintenance Matric"],
["MATH", "Mathematics"],
["MEDST", "Media Studies"],
["LEAP", "Murphy Institute for Labor &amp; Worker Education"],
["MUSIC", "Music"],
["PERM", "Permit"],
["PHIL", "Philosophy"],
["PHYS", "Physics"],
["PSCI", "Political Science"],
["PORT", "Portuguese"],
["PSYCH", "Psychology"],
["RLGST", "Religious Studies"],
["SEEK", "Search for Education, Elevation &amp; Knowledge"],
["SEYSL", "Secondary Education &amp; Youth Services-Literacy"],
["SEYS", "Secondary Education and Youth Services"],
["SOC", "Sociology"],
["SPAN", "Spanish"],
["SPST", "Special Studies"],
["STPER", "Student Personnel Department"],
["STABD", "Study Abroad"],
["URBST", "Urban Studies"],
["WOMST", "Women&#39;s Studies"],
["WLDST", "World Studies"]]

qc_department_names.each do |department_arr| 
  department = Department.create(name: department_arr[0], long_name: department_arr[1], institution: qc)
end

fall2014 = Semester.create(name: "Fall 2014")
rows = CSV.read('db/QCScheduleFall2014.csv')
rows.shift #get rid of header

#rows[x][1] is Code (Section.cfid)
#rows[x][2] is Course (Course.name, Course.credit_hour in parenthesis), e.g "ACCT 100 (3, 3)"
#rows[x][3] is Description (Course.long_name)
#rows[x][4] is Day (Section.days)
#rows[x][5] is Time (Section.start_time and Section.end_time)
#rows[x][6] is Instructor (Instructor.last_name, Instructor.first_name)
#rows[x][7] is Location (Location.name)
#rows[x][8] is Enrolled (Section.current_enrollment)
#rows[x][9] is Limit (Section.enrollment_limit)
#rows[x][10] is Mode of Instruction (Section.mode_of_instruction)

rows.each do |row|

  #Course 
  unless row[2].empty?
    course_name = row[2].split("(")[0].strip
    course_credit_hours = row[2].split("(")[1].split(",")[1].strip.split(")")[0].to_f
    department_name = course_name.split(" ")[0] 
    department = Department.find_or_create_by(name: department_name)
    course = Course.find_or_create_by(name: course_name, department: department)
    course.long_name = row[3]
    course.credit_hours = course_credit_hours
    course.save
  end

  #Instructor
  unless row[6].empty?
   last_name = row[6].split(",")[0].strip
   first_name = row[6].split(",")[1].strip
   instructor = Instructor.find_or_create_by(first_name: first_name, last_name: last_name)
  else
    instructor = nil
  end

  #Location
  location_name = row[7].strip
  location = Location.find_or_create_by(name: location_name, institution: qc) 

  section_cfid = row[1]
  section_days = row[4].strip
  section_current_enrollment = row[8].to_i
  section_enrollment_limit = row[9].to_i
  section_mode_of_instruction = row[10].strip
  
  #Section Time
  ##row[5] "3:10 PM - 6:00 PM"
  start_time_str = row[5].split("-")[0].strip # "3:10 PM"
  section_start_time = ""

  unless start_time_str.empty?
    start_time_time = Time.parse(start_time_str)
    if start_time_time.hour < 10
      section_start_time += "0"+start_time_time.hour.to_s
    else
      section_start_time += start_time_time.hour.to_s
    end

    if start_time_time.min < 10
      section_start_time += ":0"+start_time_time.min.to_s
    else
      section_start_time += ":"+start_time_time.min.to_s
    end
  # else
    # section_start_time = "99:99"
  end
  
  end_time_str = row[5].split("-")[1].strip   # "6:00 PM"
  section_end_time = ""
  unless end_time_str.empty?
    end_time_time = Time.parse(end_time_str)
    if end_time_time.hour < 10
      section_end_time += "0"+end_time_time.hour.to_s
    else
      section_end_time += start_time_time.hour.to_s
    end

    if end_time_time.min < 10
      section_end_time += ":0"+end_time_time.min.to_s
    else
      section_end_time += ":"+end_time_time.min.to_s
    end
  # else
    # section_end_time = "99:99"

  end
  section = Section.find_or_create_by(cfid: section_cfid, course: course)
  section.days = section_days
  section.start_time = section_start_time unless section_start_time.empty?
  section.end_time = section_end_time unless section_end_time.empty?
  section.current_enrollment = section_current_enrollment
  section.enrollment_limit = section_enrollment_limit
  section.mode_of_instruction = section_mode_of_instruction
  section.location = location
  section.instructor = instructor
  section.save

end
puts Section.all.length


# spreadsheet_cs_sections.each do |section| 
#   sec = Section.new()
#   sec.cfid = section[0]
#   sec.days = section[1]
#   sec.start_time = section[2]
#   sec.end_time = section[3]
#   sec.course = spreadsheet_cs_course
#   sec.save
# end
