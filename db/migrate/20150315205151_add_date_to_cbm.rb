class AddDateToCbm < ActiveRecord::Migration
  def change
    add_column :cbms, :date, :date
  end
end
