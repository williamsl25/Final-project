class CreateProgramTeachers < ActiveRecord::Migration
  def change
    create_table :program_teachers do |t|
      t.integer :program_id
      t.integer :teacher_id

      t.timestamps null: false
    end
  end
end
