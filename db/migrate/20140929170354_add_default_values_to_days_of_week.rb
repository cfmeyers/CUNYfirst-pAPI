class AddDefaultValuesToDaysOfWeek < ActiveRecord::Migration
  def change
    change_column :sections, :monday, :boolean, default: false
    change_column :sections, :tuesday, :boolean, default: false
    change_column :sections, :wednesday, :boolean, default: false
    change_column :sections, :thursday, :boolean, default: false
    change_column :sections, :friday, :boolean, default: false
    change_column :sections, :saturday, :boolean, default: false
    change_column :sections, :sunday, :boolean, default: false
  end
end
