class Admin::QuestionsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @questions = Question.all.page(params[:page]).per(20)
  end

  def show
    @question = Question.find(params[:id])
    @comment = Comment.new
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "回答状況を更新しました"
      redirect_to admin_question_path(@question)
    else
      render :show
    end
  end

  private

  def question_params
    params.require(:question).permit(:status)
  end
end

