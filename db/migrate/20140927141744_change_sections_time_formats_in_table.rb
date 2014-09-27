class ChangeSectionsTimeFormatsInTable < ActiveRecord::Migration
  def change
    change_column :sections, :start_time, :string
    change_column :sections, :end_time, :string
  end
end
