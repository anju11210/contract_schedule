class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :name, null: false, default: ""
      t.date :date
      t.time :time
      t.string :place_name
      t.string :place_adress
      t.text :description

      t.timestamps
    end
  end
end
