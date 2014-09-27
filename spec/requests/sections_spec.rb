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

    describe "GET /sections?start_after=7:00" do
    it "returns all the sections that start after 11:00" do
      s1 = FactoryGirl.create :section, start_time: "10:00"
      s2 = FactoryGirl.create :section, start_time: "11:00"
      s3 = FactoryGirl.create :section, start_time: "11:30"
      s4 = FactoryGirl.create :section, start_time: "12:00"
      s5 = FactoryGirl.create :section, start_time: "13:00"

      get "/sections?start_after=7:00", {}, { "Accept" => "application/json" }
      body = JSON.parse(response.body)
      section_start_times = body.map { |m| m["start_time"]}
      
      puts section_start_times

      # expect(section_start_times).to match_array(["11:00", "11:30", "12:00", "13:00"])

   end
  end

  # describe "GET /sections?end_before=21:00" do
  #   it "returns all the sections that finish before 21:00" do
  #  end
  # end




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
