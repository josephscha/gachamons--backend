class ChangeColumnToMonsters < ActiveRecord::Migration[6.0]
  def change
    rename_column :monsters, :level, :rarity
  end
end
