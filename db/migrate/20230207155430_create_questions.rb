class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title,    null: false, default: ""
      t.text :body,       null: false, default: ""
      t.integer :status,  null: false, default: 0

      t.timestamps
    end
  end
end
