class SectionsAddModeOfInstructionField < ActiveRecord::Migration
  def change
    add_column :sections, :mode_of_instruction, :string
  end
end
