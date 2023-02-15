class Public::QuestionsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @question = Question.new(question_params)
    @question.customer_id = current_customer.id
    if @question.save
      flash[:notice] = "ご意見・ご質問を送信いたしました"
      redirect_to customer_appointments_path(@question.customer.id)
    end
  end

  def index
    @customer = current_customer
    #アソシエーションからcustomerに紐づくquestionsを取ってくる
    @questions = @customer.questions.page(params[:page]).per(20)
  end

  def show
    @customer = current_customer
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
