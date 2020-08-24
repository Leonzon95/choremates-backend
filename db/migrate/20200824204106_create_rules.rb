class CreateRules < ActiveRecord::Migration[6.0]
  def change
    create_table :rules do |t|
      t.string :description
      t.references :house, null: false, foreign_key: true

      t.timestamps
    end
  end
end
