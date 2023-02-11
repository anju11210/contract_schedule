class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointment, dependent: :destroy
  has_many :question, dependent: :destroy
  
  enum payment_method: {
    subscription: 0,
    examine1_preparation: 1,
    examine1: 2,
    examine1_clear: 3,
    real_estates_contract_preparation: 4,
    real_estates_contract_clear: 5,
    examine2_preparation: 6,
    examine2: 7,
    examine2_clear: 8,
    mortgage_contract_preparation: 9,
    mortgage_contract_clear: 10,
    examine1: 11,
    examine1: 12,
    examine1: 13,
    examine1: 14,
    examine1: 15,
    examine1: 16,
    examine1: 17,
    examine1: 18,
    examine1: 19,
    examine1: 20,
  }
end
