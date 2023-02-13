class Public::QuestionsController < ApplicationController
  def create
    @question = Question.new(question_params)
    @question.customer_id = current_customer.id
    if @question.save
      redirect_to appointments_path
    end
  end

  def index
    @customer = current_customer
    #アソシエーションからcustomerに紐づくquestionsを取ってくる
    @questions = @customer.questions.page(params[:page]).per(20)
  end

  def show
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
