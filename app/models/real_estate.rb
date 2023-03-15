class RealEstate < ApplicationRecord
  belongs_to :customer

  with_options presence: true do
    validates :name
    validates :address
    #TODO:今回は成約価格が決まっていない状況も想定しているが、入力時は半角数字のみ許可かつ空白は許可できる方法はある？
    validates :price, numericality: { only_integer: true }
  end
end

