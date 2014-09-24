# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Section.delete_all
Course.delete_all
Department.delete_all
Institution.delete_all

school_names = ["Baruch College", "Brooklyn College", "The City College of New York", "College of Staten Island", "Hunter College", "John Jay College of Criminal Justice", "Lehman College", "Medgar Evers College", "New York City College of Technology", "Queens College", "York College"]


school_names.each do |school| 
  inst = Institution.new(name: school)
  inst.save
end

qc = Institution.find_by_name("Queens College")

qc_cs_courses = [["UNDERSTAND PERS COMP", "012"],
["INTRO COMPUTERS & CO", "012"],
["COMPUTER W/BUS APPL", "018"],
["SPEADSHEET PROGRAMMI", "048"],
["COMP APPL MATH TCHRS", "066"],
["PBM SOLVE W/CMPERS", "080"],
["HTML & WWW PGMING", "081"],
["INTR WEB PROG", "081"],
["MULTIMEDIA FUNDMTLS", "082"],
["DATABASE APPLIC PGMG", "085"],
["SCI, COMP TOOLS", "086"],
["ADV PRD TOOLS 4 BUS", "088"],
["VT: TOPICS IN COMPUT", "090"],
["SCRPT PRGRMING 4 WEB", "0903"],
["SCRIPT PRGRMNG 4 WEB", "0903"],
["R 4 STATSTCL PRGRMNG", "0903"],
["R 4 STATSTCL COMPTNG", "0903"],
["PERL PRGMNG 4 BIOINF", "0903"],
["INTRO TO PROGRAMMING", "095"],
["PRACTICUM IN PGMING", "100"],
["INTRO TO COMPUTING", "101"],
["ALGORITHM PBLM SOL 1", "111"],
["ALGORITHM PBLM SOLV", "111"],
["INT ALG PRB SLV-JAVA", "112"],
["DISCRETE MATH FOR FI", "120"],
["COMP STRUCT & ASEMBR", "141"],
["INT INTRO COMPUTING", "195"],
["DATA STRUCT/ALG ANAL", "203"],
["ALGORITHM PROB SOL 2", "211"],
["OBJ-ORIENT PROG C++", "211"],
["OBJ-ORIENT PRG JAVA", "212"],
["DISCRETE STRUCTURES", "220"],
["COMP ORG&ASSEMB LANG", "240"],
["OPERATING SYSTEMS", "241"],
["SELF-STUDY: HTML", "280"],
["PROGRAM LANGUAGES", "300"],
["DATABASE SYSTEMS", "311"],
["DATA STRUCTURES", "313"],
["ARTIFICIAL INTELL", "315"],
["PRINC PROG LANG", "316"],
["COMPUTER GRAPHICS", "318"],
["THEORY: COMPUTATION", "320"],
["ANALYSIS OF ALGORITH", "323"],
["DESGN&ANALYSIS ALG", "323"],
["DATABASE SYSTEMS", "331"],
["OBJ-ORIENTED DBASES", "332"],
["DATA MINING&WAREHSE", "334"],
["INFO ORG & RETRIEVAL", "335"],
["OPER SYS PRINC", "340"],
["COMP ORGANIZATION", "341"],
["COMP ARCHITECTURE", "343"],
["DISTRIBUTED SYSTEMS", "344"],
["LOGIC DESIGN LAB", "345"],
["DATA COMMUNICATIONS", "348"],
["PARALLEL & DIST SYS", "350"],
["CRYPTOGRAPHY", "352"],
["INTERNET & WEB TECH", "355"],
["NUMERICAL METHODS", "361"],
["ARTIFICIAL INTELL", "363"],
["COMPUTATIONAL FINANC", "365"],
["COMPUTER GRAPHICS", "368"],
["SOFTWARE ENGINEERING", "370"],
["VT: SPECIAL TOPICS I", "381"],
["ADVNCD PRGRM TECHNQS", "3813"],
["BIOINFORMATICS", "3813"],
["BIOMETR SEC&PRIVACY", "3813"],
["BIOMETRICS", "3813"],
["COMPUTATIONL FINANCE", "3813"],
["CRYPTOGRAPHY", "3813"],
["CRYPTOGRAPHY I", "3813"],
["CRYPTOGRAPHY II", "3813"],
["CRYPTOGRPHY II", "3813"],
["DATA MINING/WRHOUSNG", "3813"],
["FORENSIC COMPUTING", "3813"],
["HCI & ACCESSIBILITY", "3813"],
["HETEROG DISTR APPLIC", "3813"],
["HISTORY OF SCIENCE", "3813"],
["INFO&COMPUTR SECURTY", "3813"],
["INTERNET SECURITY", "3813"],
["INTRNT TECH WEB DSGN", "3813"],
["INTRNT TECH/WEB DSGN", "3813"],
["INTRO BIOINFORMATICS", "3813"],
["MACHINE LEARNING", "3813"],
["MOBILE COMPUTING", "3813"],
["NATURL LANG PROCSSNG", "3813"],
["NATURL LANGUAGE PROC", "3813"],
["NEXT GEN NTWRK SRVCS", "3813"],
["NTWRK PRFORMNCE EVAL", "3813"],
["NXT GEN NTWRK SERVCS", "3813"],
["NXT GNRTN NTWRK SERV", "3813"],
["OBJ ORNTD DATABASES", "3813"],
["PRGRMNG HANDHELD DEV", "3813"],
["QUANTUM COMPUTING", "3813"],
["QUANTUM COMPUTING II", "3813"],
["RANDOMIZED ALGORTHMS", "3813"],
["SOFTWARE DEVELOPMENT", "3813"],
["SPAT-TMP MDLNG&DBSES", "3813"],
["SPATIO-TMPRL DAT MDL", "3813"],
["VOICE OVER IP /WLAN", "3813"],
["VT:SPECIAL TOPICS", "3813"],
["WIRELESS NETWORKING", "3813"],
["HONOR RESEARCH", "391"],
["VT:HONORS PROBLEMS", "3913"],
["RESEARCH PROJECTS", "3953"],
["INTERNSHIP", "3983"],
["DATA STRUCTURES", "603"],
["ASBLY LANG & CPR ORG", "642"],
["ALGORITHMS I", "700"],
["SOFTWARE DESIGN", "701"],
["DATABASE SYSTEMS", "711"],
["DISTRIBUTED COMPUTNG", "715"],
["COMPUTER GRAPHICS", "718"],
["FOUND COMPUTER SCI", "721"],
["COMPUTABILITY/CMPLXY", "722"],
["SOFTWARE DEVMT PRACT", "731"],
["RESEARCH PRACTICUM", "732"],
["MASTER'S THESIS", "733"],
["COMP ARCH & NETWORKS", "744"],
["COMPUTER NETWORKS", "748"],
["ALGORITHMS II", "762"],
["COMPUTATIONAL FINANC", "765"],
["INTERNET & WEB TECH", "780"],
["INTERNET & WEB TECHN", "780"],
["INTERNET SECURITY", "780"],
["WIRELESS NETWORKING", "780"],
["INTRNT TECH/WEB DESG", "780"],
["INTRNT TECH/WEB DSGN", "780"],
["INTRNT TECH@WEB DSGN", "780"],
["INTRNT&WEB TCHNLGIES", "780"],
["INTRO BIOINFORMATICS", "780"],
["MOBILE COMPUTING", "780"],
["NEXT GEN NTWRK SRVCS", "780"],
["NXT GEN NTWRK SERVCS", "780"],
["NXT GNRTN NTWRK SERV", "780"],
["OBJCT ORIENTD DBASES", "780"],
["OBJCT ORIENTD DTBSES", "780"],
["SCH:LOGIC DESIGN LAB", "780"],
["SCH:VOIC OVR IP/WLAN", "780"],
["SCM:ALGS 4 REAL-TIME", "780"],
["SCM:CRYPTOGRAPHY", "780"],
["SCM:CRYPTOGRAPHY I", "780"],
["SCM:CRYPTOGRAPHY II", "780"],
["SCM:DAT MINING/WRSHN", "780"],
["SCM:DATA MININ&WRHSN", "780"],
["SCM:DATA MINING/WRHS", "780"],
["SCM:MACHINE LEARNING", "780"],
["SCM:NUMERICL METHODS", "780"],
["SCM:QUANTUM COMPUTNG", "780"],
["SCS:NATRL LANG PROCS", "780"],
["SCS:SFTWR DEVELOPMNT", "780"],
["SCS:SFTWR ENGINEERNG", "780"],
["SCS:SOFTWR ENGINRNG", "780"],
["SPAT-TMP MDLNG&DBSES", "780"],
["SPAT-TMP MODEL&DBASE", "780"],
["SPEC TOPICS", "780"],
["INT. TECH&WEB DESIGN", "780"],
["INRNT TECH WEB DESGN", "780"],
["INFORMATION RETRIEVL", "780"],
["INFORM ORG/RETRIEVAL", "780"],
["INFO ORG & RETRIEVAL", "780"],
["GENETIC ALGORITHMS", "780"],
["CRYPTOGRPHY II", "780"],
["CRYPTOGRAPHY", "780"],
["COMPUTATIONL FINANCE", "780"],
["BIOMETRC SEC&PRIVACY", "780"],
["BIOINFORMATICS", "780"],
["ARTIFICIAL INTLLGNCE", "780"],
["ARTIFICIAL INTELLGNC", "780"],
["ARTIFICIAL INTELL", "780"],
["INTRNT TECH&WEB DSGN", "780"],
["INTERNET SECURITY", "790"],
["OBJ ORNTD DATABASES", "790"],
["SOFTWARE ENGINEERING", "790"],
["INT. TECH&WEB DESGIN", "790"],
["VT:RESEARCH", "7991"],
["VT:RESEARCH", "7993"],
["ADVANCED MS OFFICE", "903"],
["PERL PRGMNG 4 BIOINF", "903"],
["R 4 STATSTCL COMPTNG", "903"],
["TOPICS IN COMPUTING", "903"],
["SCRIPT PRGRMNG 4 WEB", "903"],
["SCRPT PRGRMING 4 WEB", "903"],
["SECURITY", "903"],
["R 4 STATSTCL PRGRMNG", "903"]]

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
["44588", "TF", "8:00", "8:50"],
["45321", "TF", "9:00", "9:50"],
["46090", "TF", "10:05", "10:55"],
["46091", "TF", "11:10", "12:00"],
["46092", "MW", "8:00", "8:50"]]

intro_cs_course = Course.find_by_name("INTRO COMPUTERS & CO")

intro_cs_sections.each do |section| 
  sec = Section.new()
  sec.cfid = section[0]
  sec.days = section[1]
  sec.start_time = Time.parse(section[2])
  sec.end_time = Time.parse(section[3])
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
  sec.start_time = Time.parse(section[2])
  sec.end_time = Time.parse(section[3])
  sec.course = spreadsheet_cs_course
  sec.save
end
