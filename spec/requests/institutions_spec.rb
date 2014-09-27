require 'rails_helper'

describe "Institutions API" do

  describe "GET /institutions" do
    it "returns all the institutions" do
      FactoryGirl.create :institution, name: "Super School"
      FactoryGirl.create :institution, name: "Super School2"

      get "/institutions", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      institution_names = body.map { |m| m["name"] }

      expect(institution_names).to match_array(["Super School",
                                           "Super School2"])
    end
  end

  describe "GET /institutions/:id" do
    it "returns a requested course" do
      s = FactoryGirl.create :institution, name: "Super School"

      get "/institutions/#{s.id}", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      expect(body["name"]).to eq "Super School"
    end
  end
end
