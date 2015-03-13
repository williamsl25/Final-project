class AddColumnDateOfBirthGradeToStudents < ActiveRecord::Migration
  def change
    add_column :students, :date_of_birth, :date
    add_column :students, :grade, :string
  end
end
