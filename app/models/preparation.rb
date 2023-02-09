class Preparation < ApplicationRecord
  belongs_to :customer
  has_many :comment, dependent: :destroy
end
