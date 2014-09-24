class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :days
      t.time :start_time
      t.time :end_time
      t.string :cfid
      t.integer :course_id

      t.timestamps
    end
  end
end
