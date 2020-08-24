class CreateChores < ActiveRecord::Migration[6.0]
  def change
    create_table :chores do |t|
      t.string :name
      t.references :house_member, null: false, foreign_key: true
      t.references :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
