class Department < ActiveRecord::Base
  belongs_to :institution
  validates :institution_id, presence: true
  has_many :courses
end
