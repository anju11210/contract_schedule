class Public::QuestionsController < ApplicationController
  before_action :authenticate_customer!
  #before_action :thanks

  def create
    @question = Question.new(question_params)
    @question.customer_id = current_customer.id
    if @question.save
      flash[:notice] = "ご意見・ご質問を送信いたしました"
      redirect_to customer_appointments_path(@question.customer.id)
    else
      #request.referer：前のページのurlが入る → railsのrouteから情報を取り出して、pathに渡す（今回は、customerのid情報を渡すために記述）
      path = Rails.application.routes.recognize_path(request.referer)
      #pp path（ターミナル上でパスの中身を確認するための記述、表示されたものが下記）
      #{:controller=>"public/appointments", :action=>"index", :customer_id=>"4"}
      @customer = Customer.find(path[:customer_id])
      @appointments = @customer.appointments.where("date >= ?", Date.today)
      @real_estate = @customer.real_estate
      #showページ表示の際（pathにidが必要な場合）は下記も含めるという記述
      if path[:id]
          @appointment = Appointment.find(path[:id])
          @total = @appointment.earnest_money + @appointment.brokerage_fee + @appointment.revenue_stamp_fee + @appointment.remaining_amount + @appointment.real_estate_tax + @appointment.registration_fee_1 + @appointment.registration_fee_2 + @appointment.renovation_fee + @appointment.apartment_management_fee + @appointment.other_expense_1 + @appointment.other_expense_2 + @appointment.other_expense_3 + @appointment.other_expense_4 + @appointment.other_expense_5
      end
      #pathに、controllerとactionの内容を代入している（indexとshowの場合があるため）
      render "#{path[:controller]}/#{path[:action]}"
      #showがない場合は「render 'public/appointments/index'」でもok
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
    #@question.comments.update_all(confirmation_status: true)
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
