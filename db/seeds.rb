
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

rows = CSV.read('db/QCScheduleFall2014.csv')
#rows[x][1] is Code (Section.cfid)
#rows[x][2] is Course (Course.name, have to get rid of everything in parenthesis)

# qc_cs_courses.each do |course| 
#   crs = Course.new(name: course[0])
#   crs.cfid = course[1]
#   crs.department = csdepartment
#   crs.save
# end

# intro_cs_sections = [["44587", "MW", "11:10", "12:00"],
# ["44588", "TF", "08:00", "08:50"],
# ["45321", "TF", "09:00", "09:50"],
# ["46090", "TF", "10:05", "10:55"],
# ["46091", "TF", "11:10", "12:00"],
# ["46092", "MW", "08:00", "08:50"]]

# intro_cs_course = Course.find_by_name("INTRO COMPUTERS & CO")

# intro_cs_sections.each do |section| 
#   sec = Section.new()
#   sec.cfid = section[0]
#   sec.days = section[1]
#   sec.start_time = section[2]
#   sec.end_time = section[3]
#   sec.course = intro_cs_course
#   sec.save
# end

# spreadsheet_cs_sections = [["46015", "TTH", "20:30", "21:20"],
# ["46014", "TTH", "19:30", "20:20"],
# ["46016", "TTH", "18:30", "19:20"]]

# spreadsheet_cs_course = Course.find_by_name("SPEADSHEET PROGRAMMI")

# spreadsheet_cs_sections.each do |section| 
#   sec = Section.new()
#   sec.cfid = section[0]
#   sec.days = section[1]
#   sec.start_time = section[2]
#   sec.end_time = section[3]
#   sec.course = spreadsheet_cs_course
#   sec.save
# end
