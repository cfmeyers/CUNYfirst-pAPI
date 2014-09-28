class SectionAddCurrentEnrollmentEnrollmentLimitFields < ActiveRecord::Migration
  def change
    add_column :sections, :current_enrollment, :integer
    add_column :sections, :enrollment_limit, :integer
  end
end
