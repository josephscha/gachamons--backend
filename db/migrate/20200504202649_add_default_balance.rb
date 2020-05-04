class AddDefaultBalance < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :balance, :integer, :default => 100000
  end
end
