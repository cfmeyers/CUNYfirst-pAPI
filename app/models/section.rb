
class HourMinuteValidator < ActiveModel::Validator
  def validate(record)
    unless /^\d\d:\d\d$/.match(record.start_time)
      record.errors[:start_time] << 'failed to match the digit digit semicolon digit digit format'
    end

    unless /^\d\d:\d\d$/.match(record.end_time)
      record.errors[:end_time] << 'failed to match the digit digit semicolon digit digit format'
    end
  end
end

class Section < ActiveRecord::Base
  include ActiveModel::Validations
  belongs_to :course
  validates :course_id, presence: true
  belongs_to :location
  belongs_to :instructor
  belongs_to :semester
  validates_with HourMinuteValidator

  scope :start_after, -> (start_after) { where("start_time > ?", start_after) }
  scope :start_before, -> (start_before) { where("start_time < ?", start_before) }
  scope :end_after, -> (end_after) { where("end_time > ?", end_after) }
  scope :end_before, -> (end_before) { where("end_time < ?", end_before) }
  scope :course_id, -> (course_id) {
    course = Course.find(course_id)
    where(course: course)
  }
  scope :location_id, -> (location_id) {
    location = Location.find(location_id)
    where(location: location)
  }

  scope :instructor_id, -> (instructor_id) {
    instructor = Instructor.find(instructor_id)
    where(instructor: instructor)
  }
  scope :semester_id, -> (semester_id) {
    semester = Semester.find(semester_id)
    where(semester: semester)
  }
  scope :open, -> {
    where("current_enrollment < enrollment_limit")
  }
  scope :closed, -> {
    where("current_enrollment >= enrollment_limit")
  }





end
