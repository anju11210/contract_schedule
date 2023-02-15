class Question < ApplicationRecord
  belongs_to :customer
  has_many :comments, dependent: :destroy

  validates :title,  presence: true

  enum status: { unconfirmed: 0, confirming: 1, answered: 2 }

  def ja_status
    Question.statuses_i18n[status]
  end
end
