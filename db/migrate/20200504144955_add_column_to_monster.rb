class AddColumnToMonster < ActiveRecord::Migration[6.0]
  def change
    add_column :monsters, :img_url, :string
  end
end
