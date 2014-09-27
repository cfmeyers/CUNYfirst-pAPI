require 'rails_helper'

describe "Courses API" do
  describe "GET /courses" do
    it "returns all the courses" do
      FactoryGirl.create :course, name: "Computer Science Super Course"
      FactoryGirl.create :course, name: "Mathematics Super Course"

      get "/courses", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      course_names = body.map { |m| m["name"] }
      # puts course_names

      expect(course_names).to match_array(["Computer Science Super Course",
                                           "Mathematics Super Course"])
    end
  end
end
