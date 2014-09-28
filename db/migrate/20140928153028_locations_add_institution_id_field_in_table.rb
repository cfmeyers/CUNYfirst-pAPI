class LocationsAddInstitutionIdFieldInTable < ActiveRecord::Migration
  def change
    add_column :locations, :institution_id, :integer
  end
end
