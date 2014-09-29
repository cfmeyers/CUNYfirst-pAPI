class AddNameFieldsToCourseAndDepartments < ActiveRecord::Migration
  def change
    add_column :departments, :long_name, :string
    add_column :courses, :long_name, :string
  end
end
