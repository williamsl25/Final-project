class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :admin_status
      t.text :photo
      t.string :grade

      t.timestamps null: false
    end
  end
end
