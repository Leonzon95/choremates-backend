class AddNameIndexToHouses < ActiveRecord::Migration[6.0]
  def change
    add_index :houses, :name
  end
end
