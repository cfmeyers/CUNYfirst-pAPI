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

  it "should return location_id scope properly" do

    l1 = FactoryGirl.create :location, name: "SC 101"
    l2 = FactoryGirl.create :location, name: "SC 102"

    FactoryGirl.create :section, cfid: "777", location: l1
    FactoryGirl.create :section, cfid: "888", location: l1
    FactoryGirl.create :section, cfid: "999", location: l2
    expect(Section.location_id(l1.id).length).to equal(2)
    expect(Section.location_id(l2.id).length).to equal(1)
  end

  it "should return instructor_id scope properly" do

    i1 = FactoryGirl.create :instructor, first_name: "Bob", last_name: "Jones"
    i2 = FactoryGirl.create :instructor, first_name: "Leslie", last_name: "Coogan"

    FactoryGirl.create :section, cfid: "777", instructor: i1
    FactoryGirl.create :section, cfid: "888", instructor: i1
    FactoryGirl.create :section, cfid: "999", instructor: i2
    expect(Section.instructor_id(i1.id).length).to equal(2)
    expect(Section.instructor_id(i2.id).length).to equal(1)
  end

  it "should return open scope properly" do

    FactoryGirl.create :section, cfid: "777", current_enrollment: 25, enrollment_limit: 25
    FactoryGirl.create :section, cfid: "777", current_enrollment: 25, enrollment_limit: 30
    FactoryGirl.create :section, cfid: "888", current_enrollment: 25, enrollment_limit: 23
    FactoryGirl.create :section, cfid: "999", current_enrollment: 30, enrollment_limit: 40

    expect(Section.open.length).to equal(2)
  end

  it "should return exclude_days scope properly" do

    FactoryGirl.create :section, cfid: "555", monday: true, wednesday: true
    FactoryGirl.create :section, cfid: "777", friday: true, saturday: true
    FactoryGirl.create :section, cfid: "888", monday: true, tuesday: true
    FactoryGirl.create :section, cfid: "999", monday: true, tuesday: true

    expect(Section.exclude_days([:monday]).length).to equal(1)
    expect(Section.exclude_days([:friday]).length).to equal(3)
    expect(Section.exclude_days([:friday, :monday]).length).to equal(0)
  end

  it "should return include_days scope properly" do

    FactoryGirl.create :section, cfid: "555", monday: true, wednesday: true
    FactoryGirl.create :section, cfid: "777", friday: true, saturday: true
    FactoryGirl.create :section, cfid: "888", monday: true, tuesday: true
    FactoryGirl.create :section, cfid: "999", monday: true, tuesday: true

    expect(Section.include_days([:monday]).length).to equal(3)
    expect(Section.include_days([:friday]).length).to equal(1)
    expect(Section.include_days([:friday, :monday]).length).to equal(0)
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
