class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :nickname
      t.string :img
      t.string :gender
      t.integer :balance
      t.timestamps
    end
  end
end
