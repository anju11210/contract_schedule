class Appointment < ApplicationRecord
  belongs_to :customer

  with_options presence: true do
    validates :name
    validates :earnest_money
    validates :brokerage_fee
    validates :revenue_stamp_fee
    validates :remaining_amount
    validates :real_estate_tax
    validates :registration_fee_1
    validates :registration_fee_2
    validates :renovation_fee
    validates :apartment_management_fee
    validates :other_expense_1
    validates :other_expense_2
    validates :other_expense_3
    validates :other_expense_4
    validates :other_expense_5
  end
end
