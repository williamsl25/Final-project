class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :grade
      t.boolean :admin_status

      t.timestamps null: false
    end
  end
end
