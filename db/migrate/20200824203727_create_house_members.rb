class CreateHouseMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :house_members do |t|
      t.string :name
      t.references :house, null: false, foreign_key: true

      t.timestamps
    end
  end
end
