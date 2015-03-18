class AddDateTakenToTest < ActiveRecord::Migration
  def change
    add_column :tests, :date_taken, :date
  end
end
