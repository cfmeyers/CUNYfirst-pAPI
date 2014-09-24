class Course < ActiveRecord::Base
  belongs_to :department
  validates :department_id, presence: true
  has_many :sections
end
