require 'rails_helper'

describe "Departments API" do

  describe "GET /departments" do
    it "returns all the departments" do
      FactoryGirl.create :department, name: "Super Department"
      FactoryGirl.create :department, name: "Super Department2"

      get "/departments", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      department_names = body.map { |m| m["name"] }

      expect(department_names).to match_array(["Super Department",
                                           "Super Department2"])
    end
  end

  describe "GET /departments/:id" do
    it "returns a requested department" do
      d = FactoryGirl.create :department, name: "Super Department"

      get "/departments/#{d.id}", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      expect(body["name"]).to eq "Super Department"
    end
  end
end
