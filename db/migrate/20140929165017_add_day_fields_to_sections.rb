class AddDayFieldsToSections < ActiveRecord::Migration
  def change
    add_column :sections, :monday, :boolean
    add_column :sections, :tuesday, :boolean
    add_column :sections, :wednesday, :boolean
    add_column :sections, :thursday, :boolean
    add_column :sections, :friday, :boolean
    add_column :sections, :saturday, :boolean
    add_column :sections, :sunday, :boolean
    remove_column :sections, :days
  end
end
