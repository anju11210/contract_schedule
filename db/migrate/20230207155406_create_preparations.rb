class CreatePreparations < ActiveRecord::Migration[6.1]
  def change
    create_table :preparations do |t|
      t.string :name, null: false, default: ""
      t.integer :amount
      t.integer :price

      t.timestamps
    end
  end
end
