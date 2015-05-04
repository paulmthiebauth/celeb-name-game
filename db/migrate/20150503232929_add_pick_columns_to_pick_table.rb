class AddPickColumnsToPickTable < ActiveRecord::Migration
  def change
    add_column :picks, :pick_number2, :integer
    add_column :picks, :pick_number3, :integer
    add_column :picks, :pick_number4, :integer
    add_column :picks, :pick_number5, :integer
  end
end
