class AddStudentIdToTests < ActiveRecord::Migration
  def change
    add_column :tests, :student_id, :integer
    add_column :tests, :testable_id, :integer
    add_column :tests, :testable_type, :string
  end
end
