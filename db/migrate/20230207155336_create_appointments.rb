class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :name, null: false
      t.date :date
      t.time :time
      t.string :place_name
      t.string :place_address
      t.text :description_1
      t.text :description_2
      t.string :preparation_thing
      t.integer :earnest_money, null: false, default: 0
      t.integer :brokerage_fee, null: false, default: 0
      t.integer :revenue_stamp_fee, null: false, default: 0
      t.integer :remaining_amount, null: false, default: 0
      t.integer :real_estate_tax, null: false, default: 0
      t.integer :registration_fee_1, null: false, default: 0
      t.integer :registration_fee_2, null: false, default: 0
      t.integer :renovation_fee, null: false, default: 0
      t.integer :apartment_management_fee, null: false, default: 0
      t.integer :other_expense_1, null: false, default: 0
      t.integer :other_expense_2, null: false, default: 0
      t.integer :other_expense_3, null: false, default: 0
      t.integer :other_expense_4, null: false, default: 0
      t.integer :other_expense_5, null: false, default: 0
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
