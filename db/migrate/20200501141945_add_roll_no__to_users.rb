class AddRollNoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :roll_no, :string
    add_index :users, :roll_no, unique: true
  end
end
