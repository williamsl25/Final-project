class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :score
      t.string :description
      t.date :date

      t.timestamps null: false
    end
  end
end
