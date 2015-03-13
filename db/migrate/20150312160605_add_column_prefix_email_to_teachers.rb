class AddColumnPrefixEmailToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :prefix, :string
    add_column :teachers, :email, :string
  end
end
