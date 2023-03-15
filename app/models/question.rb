class Question < ApplicationRecord
  belongs_to :customer
  has_many :comments, dependent: :destroy

  #NOTE:スペースのみ投稿等を制限したいと考えたが、questionsコントローラーの記述がうまくいかずエラーが発生してしまうため、コメントアウト。※学習期間終了後記述
  # with_options presence: true do
  #   validates :title
  #   validates :body
  # end

  enum status: { unconfirmed: 0, confirming: 1, answered: 2 }

  def ja_status
    Question.statuses_i18n[status]
  end
end

