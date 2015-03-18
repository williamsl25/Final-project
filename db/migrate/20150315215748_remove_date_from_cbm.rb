class RemoveDateFromCbm < ActiveRecord::Migration
  def change
    remove_column :cbms, :date, :date
  end
end
