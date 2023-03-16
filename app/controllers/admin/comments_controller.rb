class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def create
    @question = Question.find(params[:id])
    @comment = Comment.new(comment_params)
    #NOTE:3行目で取得しているquestionのidを、6行目で代入している（hiddenを使う方法と結果は同じ）
    @comment.question_id = @question.id
    if @comment.save
      flash.now[:notice] = "回答の送信に成功しました。"
      #redirect_to admin_question_path(@question)
      render 'admin/questions/comment_create'
    else
      flash.now[:alert] = "回答の送信に失敗しました。"
      #render 'admin/questions/show'
      render 'admin/questions/error'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

