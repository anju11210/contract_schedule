class RealEstate < ApplicationRecord
  belongs_to :customer

  with_options presence: true do
    validates :name
    validates :address
  end
end
