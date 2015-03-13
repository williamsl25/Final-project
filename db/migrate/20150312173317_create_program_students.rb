class CreateProgramStudents < ActiveRecord::Migration
  def change
    create_table :program_students do |t|
      t.integer :program_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
