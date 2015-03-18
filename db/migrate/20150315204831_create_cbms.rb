class CreateCbms < ActiveRecord::Migration
  def change
    create_table :cbms do |t|
      t.integer :score
      t.string :description

      t.timestamps null: false
    end
  end
end
