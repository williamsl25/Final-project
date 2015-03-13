class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.string :focus
      t.integer :student_id
      t.integer :teacher_id

      t.timestamps null: false
    end
  end
end
