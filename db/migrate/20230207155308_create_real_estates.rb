class CreateRealEstates < ActiveRecord::Migration[6.1]
  def change
    create_table :real_estates do |t|
      t.string :name,   null: false, default: ""
      t.string :adress, null: false, default: ""
      t.integer :price, null: false, default: ""

      t.timestamps
    end
  end
end
