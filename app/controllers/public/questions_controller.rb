class Public::QuestionsController < ApplicationController
  def create
    @question = Question.new(question_params)
    @question.customer_id = current_customer.id
    if @question.save
      redirect_to appointments_path
    end
  end

  def index
    @questions = Question.all
  end

  def show
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
