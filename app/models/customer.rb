class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointments, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_one :real_estate

  with_options presence: true do
    validates :last_name
    validates :first_name
    with_options format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: :katakana} do
      validates :last_name_kana
      validates :first_name_kana
    end
    validates :address
    validates :phone_number, format: {with: /\A\d{10}$|^\d{11}\z/, message: :phone_number_digit}
    validates :email
    with_options length: { minimum: 6 }, on: :create do
      validates :password
      validates :password_confirmation
    end
  end

  enum status: {
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
    transfer_preparation: 11,
    transfer_clear: 12,
    wait_seller: 13,
    wait_bank: 14,
    wait_judicial_scrivener: 15,
    wait_house_investigator: 16,
    wait_management_company: 17,
    wait_management_association: 18,
    wait_public_institution: 19,
    wait_house_builder: 20,
    wait_third_person: 21,
  }

  #進捗ステータスを表示させるビュー上の記述を簡潔にする
  def ja_status
    Customer.statuses_i18n[status]
  end
  ##3366FF
  def active_text
    if is_active?
      '有効'
    else
      '退会'
    end
  end

  #退会していたらログインできないようにする
  #active_for_authentication：deviseのgemの中に定義されているメソッド
  def active_for_authentication?
    super && is_active
  end

  def self.search(keyword)
    where("last_name_kana like :keyword OR first_name_kana like :keyword OR phone_number like :keyword", keyword: "%#{keyword}%")
  end

end
