class AddDescriptionToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :description, :text
  end
end
