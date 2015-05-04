class CreatePicksTable < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :pick_number
      t.string :attribute_1
      t.string :attribute_2
    end
  end
end
