class ChangeRarityToString < ActiveRecord::Migration[6.0]
  def change
    change_column :monsters, :rarity, :string
  end
end
