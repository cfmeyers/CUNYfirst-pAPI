require 'rails_helper'

# RSpec.describe Section, :type => :model do
describe Section do
  it "should return start_after scope properly" do
    FactoryGirl.create :section, cfid: "888", start_time: "10:00"
    FactoryGirl.create :section, cfid: "777", start_time: "10:30"
    FactoryGirl.create :section, cfid: "999", start_time: "10:20"
    expect(Section.start_after("10:15").length).to equal(2)
  end

  it "should return start_before scope properly" do
    FactoryGirl.create :section, cfid: "888", start_time: "10:00"
    FactoryGirl.create :section, cfid: "777", start_time: "10:30"
    FactoryGirl.create :section, cfid: "999", start_time: "10:20"
    expect(Section.start_before("10:15").length).to equal(1)
  end

  it "should return end_after scope properly" do
    FactoryGirl.create :section, cfid: "888", end_time: "10:00"
    FactoryGirl.create :section, cfid: "777", end_time: "10:30"
    FactoryGirl.create :section, cfid: "999", end_time: "10:20"
    expect(Section.end_after("10:15").length).to equal(2)
  end

  it "should return end_before scope properly" do
    FactoryGirl.create :section, cfid: "888", end_time: "10:00"
    FactoryGirl.create :section, cfid: "777", end_time: "10:30"
    FactoryGirl.create :section, cfid: "999", end_time: "10:20"
    expect(Section.end_before("10:15").length).to equal(1)
  end

  it "should return course_id scope properly" do

    c1 = FactoryGirl.create :course, name: "Computer Science 101"
    c2 = FactoryGirl.create :course, name: "Computer Science 102"

    FactoryGirl.create :section, cfid: "777", course: c1
    FactoryGirl.create :section, cfid: "888", course: c1
    FactoryGirl.create :section, cfid: "999", course: c2
    expect(Section.course_id(c1.id).length).to equal(2)
    expect(Section.course_id(c2.id).length).to equal(1)
  end

  it "should combine multiple scopes properly" do

    c1 = FactoryGirl.create :course, name: "Computer Science 101"
    c2 = FactoryGirl.create :course, name: "Computer Science 102"

    FactoryGirl.create :section, cfid: "777", course: c1, end_time: "10:00"
    FactoryGirl.create :section, cfid: "888", course: c1, end_time: "10:30"
    FactoryGirl.create :section, cfid: "888", course: c1, end_time: "14:30"
    FactoryGirl.create :section, cfid: "999", course: c2, end_time: "10:20"
    expect(Section.course_id(c1.id).end_after("10:15").length).to equal(2)
    expect(Section.course_id(c1.id).end_after("10:30").length).to equal(1)
  end




end
