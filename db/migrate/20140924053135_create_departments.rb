class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.string :cfid
      t.integer :institution_id

      t.timestamps
    end
  end
end
