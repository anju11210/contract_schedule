class CreateRealEstates < ActiveRecord::Migration[6.1]
  def change
    create_table :real_estates do |t|
      t.string :name
      t.string :address
      t.integer :price
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
