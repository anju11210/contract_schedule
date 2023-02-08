class CreateRealEstates < ActiveRecord::Migration[6.1]
  def change
    create_table :real_estates do |t|
      t.string :name
      t.string :address
      t.integer :price
      #外部キー制約付き（存在しない会員idとは紐づかない）注意：物件がある限り、会員を消せない
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
