class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :name, null: false
      t.date :date
      t.time :time
      t.string :place_name
      t.string :place_address
      t.text :description
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
