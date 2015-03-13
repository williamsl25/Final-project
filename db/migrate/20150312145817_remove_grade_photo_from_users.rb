class RemoveGradePhotoFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :grade
    remove_column :users, :photo
  end
end
