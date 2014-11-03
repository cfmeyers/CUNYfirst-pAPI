require 'rails_helper'

describe "Sections API" do

  describe "GET /sections" do
    it "returns all the sections" do
      FactoryGirl.create :section, cfid: "888"
      FactoryGirl.create :section, cfid: "999"

      get "/sections", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      section_cfids = body.map { |m| m["cfid"] }

      expect(section_cfids).to match_array(["888","999"])
    end
  end
  
##VERBOSE TEST
  describe "GET /sections?verbose=true" do
    it "returns all the sections packaged with additional names" do
      
      c1 = FactoryGirl.create :course, name: "Computer Science 101"
      c2 = FactoryGirl.create :course, name: "Computer Science 102"

      s1 = FactoryGirl.create :section, cfid: "777", course: c1
      s2 = FactoryGirl.create :section, cfid: "888", course: c1
      s3 = FactoryGirl.create :section, cfid: "999", course: c2

      get "/sections?verbose=true", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      section_course_names = body.map { |m| m["course"]["name"] }
      pp body[0]

      expect(section_course_names).to match_array(["Computer Science 101","Computer Science 101", "Computer Science 102"])
    end
  end



  describe "GET /sections?course_id=1" do
    it "returns all the sections associated with course_id 1" do

      c1 = FactoryGirl.create :course, name: "Computer Science 101"
      c2 = FactoryGirl.create :course, name: "Computer Science 102"

      s1 = FactoryGirl.create :section, cfid: "777", course: c1
      s2 = FactoryGirl.create :section, cfid: "888", course: c1
      s3 = FactoryGirl.create :section, cfid: "999", course: c2

      get "/sections?course_id=#{c1.id}", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      section_cfids = body.map { |m| m["cfid"] }

      expect(section_cfids).to match_array(["777", "888"])

      get "/sections", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      section_cfids = body.map { |m| m["cfid"] }

      expect(section_cfids).to match_array(["777", "888", "999"])
    end
  end

  describe "GET /sections?instructor_id=1" do
    it "returns all the sections associated with instructor_id 1" do

      i1 = FactoryGirl.create :instructor, first_name: "Ahmed", last_name: "Massoud"
      i2 = FactoryGirl.create :instructor, first_name: "Li", last_name: "Kaichek"

      s1 = FactoryGirl.create :section, cfid: "777", instructor: i1
      s2 = FactoryGirl.create :section, cfid: "888", instructor: i1
      s3 = FactoryGirl.create :section, cfid: "999", instructor: i2

      get "/sections?instructor_id=#{i2.id}", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      section_cfids = body.map { |m| m["cfid"] }

      expect(section_cfids).to match_array(["999"])

      get "/sections", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      section_cfids = body.map { |m| m["cfid"] }

      expect(section_cfids).to match_array(["777", "888", "999"])
    end
  end

  describe "GET /sections?semester_id=1" do
    it "returns all the sections associated with semester_id 1" do

      z1 = FactoryGirl.create :semester, name: "Fall 2014"
      z2 = FactoryGirl.create :semester, name: "Spring 2014"

      s1 = FactoryGirl.create :section, cfid: "777", semester: z1
      s2 = FactoryGirl.create :section, cfid: "888", semester: z1
      s3 = FactoryGirl.create :section, cfid: "999", semester: z2

      get "/sections?semester_id=#{z1.id}", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      section_cfids = body.map { |m| m["cfid"] }

      expect(section_cfids).to match_array(["777", "888"])

      get "/sections", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      section_cfids = body.map { |m| m["cfid"] }

      expect(section_cfids).to match_array(["777", "888", "999"])
    end
  end

  describe "GET /sections?location_id=1" do
    it "returns all the sections associated with location_id 1" do

      l1 = FactoryGirl.create :location, name: "KY 212"
      l2 = FactoryGirl.create :location, name: "BL 333"

      s1 = FactoryGirl.create :section, cfid: "777", location: l1
      s2 = FactoryGirl.create :section, cfid: "888", location: l1
      s3 = FactoryGirl.create :section, cfid: "999", location: l2

      get "/sections?location_id=#{l2.id}", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      section_cfids = body.map { |m| m["cfid"] }

      expect(section_cfids).to match_array(["999"])

      get "/sections", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      section_cfids = body.map { |m| m["cfid"] }

      expect(section_cfids).to match_array(["777", "888", "999"])
    end
  end

  describe "GET /sections?open=true" do
    it "returns all the sections that are open" do

      s1 = FactoryGirl.create :section, cfid: "555", current_enrollment: 25, enrollment_limit: 25
      s2 = FactoryGirl.create :section, cfid: "777", current_enrollment: 25, enrollment_limit: 30
      s3 = FactoryGirl.create :section, cfid: "888", current_enrollment: 25, enrollment_limit: 23
      s4 = FactoryGirl.create :section, cfid: "999", current_enrollment: 30, enrollment_limit: 40

      get "/sections?open=true", {}, { "Accept" => "application/json" }
      body = JSON.parse(response.body)
      section_cfids = body.map { |m| m["cfid"]}
      
      expect(section_cfids).to match_array(["777","999"])
    end
  end

  describe "GET /sections?closed=true" do
    it "returns all the sections that are closed" do

      s1 = FactoryGirl.create :section, cfid: "555", current_enrollment: 25, enrollment_limit: 25
      s2 = FactoryGirl.create :section, cfid: "777", current_enrollment: 25, enrollment_limit: 30
      s3 = FactoryGirl.create :section, cfid: "888", current_enrollment: 25, enrollment_limit: 23
      s4 = FactoryGirl.create :section, cfid: "999", current_enrollment: 30, enrollment_limit: 40

      get "/sections?closed=true", {}, { "Accept" => "application/json" }
      body = JSON.parse(response.body)
      section_cfids = body.map { |m| m["cfid"]}
      
      expect(section_cfids).to match_array(["555","888"])
    end
  end

  describe "GET /sections?exclude_days[]=monday&exclude_days[]=tuesday" do
    it "returns all the sections that meet on neither monday nor tuesday" do

      FactoryGirl.create :section, cfid: "555", monday: true, wednesday: true
      FactoryGirl.create :section, cfid: "777", friday: true, saturday: true
      FactoryGirl.create :section, cfid: "888", monday: true, tuesday: true
      FactoryGirl.create :section, cfid: "999", monday: true, tuesday: true

      get "/sections?exclude_days[]=monday&exclude_days[]=tuesday", {}, { "Accept" => "application/json" }
      body = JSON.parse(response.body)
      section_cfids = body.map { |m| m["cfid"]}

      expect(section_cfids).to match_array(["777"])
    end
  end

  describe "GET /sections?include_days[]=monday&include_days[]=friday" do
    it "returns all the sections that meet on both monday and friday" do

      FactoryGirl.create :section, cfid: "555", monday: true, friday: true
      FactoryGirl.create :section, cfid: "777", friday: true, saturday: true
      FactoryGirl.create :section, cfid: "888", monday: true, tuesday: true
      FactoryGirl.create :section, cfid: "999", monday: true, friday: true

      get "/sections?include_days[]=monday&include_days[]=friday", {}, { "Accept" => "application/json" }
      body = JSON.parse(response.body)
      section_cfids = body.map { |m| m["cfid"]}

      expect(section_cfids).to match_array(["555","999"])
    end
  end



  describe "GET /sections?start_after=11:00" do
    it "returns all the sections that start after 11:00" do
      s1 = FactoryGirl.create :section, start_time: "10:00"
      s2 = FactoryGirl.create :section, start_time: "11:00"
      s3 = FactoryGirl.create :section, start_time: "11:30"
      s4 = FactoryGirl.create :section, start_time: "12:00"
      s5 = FactoryGirl.create :section, start_time: "13:00"

      get "/sections?start_after=11:00", {}, { "Accept" => "application/json" }
      body = JSON.parse(response.body)
      section_start_times = body.map { |m| m["start_time"]}
      
      expect(section_start_times).to match_array(["11:30", "12:00", "13:00"])
    end
  end

  describe "GET /sections?start_before=11:00" do
    it "returns all the sections that start before 11:00" do
      s1 = FactoryGirl.create :section, start_time: "10:00"
      s2 = FactoryGirl.create :section, start_time: "11:00"
      s3 = FactoryGirl.create :section, start_time: "11:30"
      s4 = FactoryGirl.create :section, start_time: "12:00"
      s5 = FactoryGirl.create :section, start_time: "13:00"

      get "/sections?start_before=11:00", {}, { "Accept" => "application/json" }
      body = JSON.parse(response.body)
      section_start_times = body.map { |m| m["start_time"]}
      
      expect(section_start_times).to match_array(["10:00"])
    end
  end

  describe "GET /sections?end_after=11:00" do
    it "returns all the sections that end after 11:00" do
      s1 = FactoryGirl.create :section, end_time: "10:00"
      s2 = FactoryGirl.create :section, end_time: "11:00"
      s3 = FactoryGirl.create :section, end_time: "11:30"
      s4 = FactoryGirl.create :section, end_time: "12:00"
      s5 = FactoryGirl.create :section, end_time: "13:00"

      get "/sections?end_after=11:00", {}, { "Accept" => "application/json" }
      body = JSON.parse(response.body)
      section_end_times = body.map { |m| m["end_time"]}
      
      expect(section_end_times).to match_array(["11:30", "12:00", "13:00"])
    end
  end

  describe "GET /sections?end_before=11:00" do
    it "returns all the sections that end before 11:00" do
      s1 = FactoryGirl.create :section, end_time: "10:00"
      s2 = FactoryGirl.create :section, end_time: "11:00"
      s3 = FactoryGirl.create :section, end_time: "11:30"
      s4 = FactoryGirl.create :section, end_time: "12:00"
      s5 = FactoryGirl.create :section, end_time: "13:00"

      get "/sections?end_before=11:00", {}, { "Accept" => "application/json" }
      body = JSON.parse(response.body)
      section_end_times = body.map { |m| m["end_time"]}
      
      expect(section_end_times).to match_array(["10:00"])
    end
  end

  describe "GET /sections?end_before=11:00&start_after=10:00" do
    it "returns all the sections that end before 11:00 and start after 10:00" do
      s1 = FactoryGirl.create :section, cfid:"1", start_time: "10:01", end_time: "10:00"
      s2 = FactoryGirl.create :section, cfid:"2", start_time: "10:01", end_time: "11:00"
      s3 = FactoryGirl.create :section, cfid:"3", start_time: "10:01", end_time: "11:30"
      s4 = FactoryGirl.create :section, cfid:"4", start_time: "10:01", end_time: "12:00"
      s5 = FactoryGirl.create :section, cfid:"5", start_time: "10:01", end_time: "13:00"
      s1 = FactoryGirl.create :section, cfid:"6", start_time: "09:01", end_time: "10:00"

      get "/sections?end_before=11:00&start_after=10:00", {}, { "Accept" => "application/json" }
      body = JSON.parse(response.body)
      section_cfids = body.map { |m| m["cfid"]}
      
      expect(section_cfids).to match_array(["1"])
    end
  end

  describe "GET /sections?course_id=1&start_after=10:00" do
    it "returns all the sections that end after 10:00 and have course_id of 1" do

      c1 = FactoryGirl.create :course, cfid:"22"
      c2 = FactoryGirl.create :course, cfid:"88"
      s1 = FactoryGirl.create :section, cfid:"1", start_time: "10:01", end_time: "10:00", course: c1
      s2 = FactoryGirl.create :section, cfid:"2", start_time: "10:01", end_time: "11:00", course: c1
      s3 = FactoryGirl.create :section, cfid:"3", start_time: "10:01", end_time: "11:30", course: c1
      s4 = FactoryGirl.create :section, cfid:"4", start_time: "10:01", end_time: "12:00", course: c2
      s5 = FactoryGirl.create :section, cfid:"5", start_time: "10:01", end_time: "13:00", course: c1
      s1 = FactoryGirl.create :section, cfid:"6", start_time: "09:01", end_time: "10:00", course: c1

      get "/sections?course_id=#{c1.id}&start_after=10:00", {}, { "Accept" => "application/json" }
      body = JSON.parse(response.body)
      section_cfids = body.map { |m| m["cfid"]}
      
      expect(section_cfids).to match_array(["1", "2", "3", "5"])
    end
  end

  describe "GET /sections?course_id=1&start_after=10:00&end_before=12:00" do
    it "returns all the sections that end after 10:00 and have course_id of 1 and end before 12:00" do

      c1 = FactoryGirl.create :course, cfid:"22"
      c2 = FactoryGirl.create :course, cfid:"88"
      s1 = FactoryGirl.create :section, cfid:"1", start_time: "10:01", end_time: "10:00", course: c1
      s2 = FactoryGirl.create :section, cfid:"2", start_time: "10:01", end_time: "11:00", course: c1
      s3 = FactoryGirl.create :section, cfid:"3", start_time: "10:01", end_time: "11:30", course: c1
      s4 = FactoryGirl.create :section, cfid:"4", start_time: "10:01", end_time: "12:00", course: c2
      s5 = FactoryGirl.create :section, cfid:"5", start_time: "10:01", end_time: "11:00", course: c1
      s1 = FactoryGirl.create :section, cfid:"6", start_time: "09:01", end_time: "10:00", course: c1

      get "/sections?course_id=#{c1.id}&start_after=10:00&end_before=12:00", {}, { "Accept" => "application/json" }
      body = JSON.parse(response.body)
      section_cfids = body.map { |m| m["cfid"]}
      
      expect(section_cfids).to match_array(["1", "2", "3", "5"])
    end
  end



  


  describe "GET /sections/:id" do
    it "returns a requested section" do
      d = FactoryGirl.create :section, cfid: "888"

      get "/sections/#{d.id}", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      expect(body["cfid"]).to eq "888"
    end
  end

  
end
