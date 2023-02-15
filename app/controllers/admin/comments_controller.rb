class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def create
    @question = Question.find(params[:id])
    comment = Comment.new(comment_params)
    #3行目で取得しているquestionのidを、6行目で代入している（ヒドゥンを使う方法と結果は同じ）
    comment.question_id = @question.id
    comment.save
    redirect_to admin_question_path(@question.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
