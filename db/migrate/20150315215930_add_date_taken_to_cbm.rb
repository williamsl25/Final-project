class AddDateTakenToCbm < ActiveRecord::Migration
  def change
    add_column :cbms, :date_taken, :date
  end
end
