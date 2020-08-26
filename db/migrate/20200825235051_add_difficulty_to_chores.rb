class AddDifficultyToChores < ActiveRecord::Migration[6.0]
  def change
    add_column :chores, :difficulty, :string
  end
end
