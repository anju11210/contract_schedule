class Appointment < ApplicationRecord
  belongs_to :customer

  with_options presence: true do
    validates :name
    with_options numericality: { only_integer: true } do
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

  #インスタンスメソッド（コールバックと比べて引数を渡しやすい）：コントローラーで定義される（インスタンス変数.メソッド名）
  def set_time_date
    #NOTE:dateが存在していたら、dateのフォームから年月日を取得
    if self.date.present?
      year = self.date.year
      month = self.date.month
      day = self.date.day
      #NOTE:フォームから取得した値をtimeに代入
      self.time = self.time.change(year: year, month: month, day: day)
    end
  end

  #NOTE:もっと簡潔なコードもあるそうだが、今回はあえてこのまま（何が足されているのか、可視化できた方がわかりやすいため）
  def total_money
    earnest_money + brokerage_fee + revenue_stamp_fee + remaining_amount + real_estate_tax + registration_fee_1 + registration_fee_2 + renovation_fee + apartment_management_fee + other_expense_1 + other_expense_2 + other_expense_3 + other_expense_4 + other_expense_5
  end
end

