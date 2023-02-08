class CreatePreparations < ActiveRecord::Migration[6.1]
  def change
    create_table :preparations do |t|
      t.string :name, null: false
      t.integer :amount
      t.integer :price
      t.references :appointment, foreign_key: true

      t.timestamps
    end
  end
end
