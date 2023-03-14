class Public::QuestionsController < ApplicationController
  before_action :authenticate_customer!
  before_action :thanks

  def create
    @question = Question.new(question_params)
    @question.customer_id = current_customer.id
    @question.save!
    flash[:notice] = "ご意見・ご質問を送信しました。"
    redirect_to questions_path
  end

  def index
    @customer = current_customer
    #TODO:URL直打ちでの他会員question/indexの表示を制限したい（ログイン中の会員でもroot_pathに戻されてしまう）
    # customer_id = params[:id].to_i
    # login_customer_id = current_customer.id
    # if(customer_id != login_customer_id)
    #   redirect_to root_path
    # end
    #NOTE:アソシエーションからcustomerに紐づくquestionsを取ってくる
    @questions = @customer.questions.page(params[:page]).per(20)
  end

  def show
    @customer = current_customer
    #TODO:URL直打ちでの他会員question/indexの表示を制限したい（ログイン中の会員でもroot_pathに戻されてしまう）
    # customer_id = params[:id].to_i
    # login_customer_id = current_customer.id
    # if(customer_id != login_customer_id)
    #   redirect_to root_path
    # end
    @question = Question.find(params[:id])
    #NOTE:update_all：「.」の左側の複数のアクティブレコードに対して使用（一つの場合はupdate）
    @question.comments.update_all(confirmation_status: true)
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end

