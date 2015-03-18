class AddStudentIdToCbms < ActiveRecord::Migration
  def change
    add_column :cbms, :student_id, :integer
    add_column :cbms, :cbmable_id, :integer
    add_column :cbms, :cbmable_type, :string
  end
end
