class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :body
      t.integer :status, null: false, default: 0
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
