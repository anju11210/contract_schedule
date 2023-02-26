class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body,                   null: false
      t.boolean :checked,             null: false, default: false
      t.references :question,         foreign_key: true
      t.boolean :confirmation_status, null: false, default: false

      t.timestamps
    end
  end
end

