class CreateLeadersTable < ActiveRecord::Migration
  def change
    create_table :leaders do |t|
      t.integer :user_id
      t.integer :score
    end
  end
end
