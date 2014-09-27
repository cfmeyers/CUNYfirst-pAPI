
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
  validates_with HourMinuteValidator
end
