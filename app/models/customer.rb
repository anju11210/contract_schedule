class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointments, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_one :real_estate

  validates :last_name,  presence: true
  validates :first_name, presence: true
  # カタカナ制限
  validates :last_name_kana,  presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :first_name_kana, presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :address, presence: true
  validates :phone_number, presence: true, format: {with: /\A\d{10}$|^\d{11}\z/, message: '10桁か11桁の電話番号を入力してください。'}
  validates :email,  presence: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, length: { minimum: 6 }, on: :create

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

  #進捗ステータスのビュー上の記述を簡潔にする
  def ja_status
    Customer.statuses_i18n[status]
  end

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
