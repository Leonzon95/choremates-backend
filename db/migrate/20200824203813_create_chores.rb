class CreateChores < ActiveRecord::Migration[6.0]
  def change
    create_table :chores do |t|
      t.string :name
      t.string :day
      t.references :house_member, foreign_key: true
      
      t.timestamps
    end
  end
end
