class UpdatePickNumberOneColumn < ActiveRecord::Migration
  def up
    rename_column :picks, :pick_number, :pick_number1
  end
  def down
    rename_column :picks, :pick_number1, :pick_number
  end

end
