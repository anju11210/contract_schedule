class Admin::QuestionsController < ApplicationController
  def index
    @questions = Question.all.page(params[:page]).per(20)
    # @question_customer = @questions.customer_id
  end

  def show
    @question = Question.find(params[:id])
  end

  def update
  end
end
