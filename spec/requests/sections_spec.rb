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

      expect(section_cfids).to match_array(["888",
                                           "999"])
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
