class SectionsAddInstructorAndLocationId < ActiveRecord::Migration
  def change
        add_column :sections, :location_id, :integer
        add_column :sections, :instructor_id, :integer
  end
end
