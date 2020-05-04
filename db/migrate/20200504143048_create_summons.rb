class CreateSummons < ActiveRecord::Migration[6.0]
  def change
    create_table :summons do |t|
      t.integer :monster_id
      t.integer :user_id
      t.timestamps
    end
  end
end
