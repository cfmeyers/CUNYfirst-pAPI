class Institution < ActiveRecord::Base
  has_many :departments
  has_many :locations
end
