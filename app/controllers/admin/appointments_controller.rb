class Admin::AppointmentsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @customer = Customer.find(params[:customer_id])
    @real_estate = @customer.real_estate
    @appointment = Appointment.new
    #下記のように記述すれば、customerのidを含ませたappointmentが作成できる（build：newと同義で、has_manyの後ろにあればどちらでも使える）
    # @appointment = @customer.appointments.build
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.set_time_date
    if @appointment.save
      flash[:notice] = "登録に成功しました。"
      redirect_to admin_customer_appointments_path(@customer)
    else
      flash.now[:alert] = "登録に失敗しました。"
      render :new
    end
  end

  def index
    @customer = Customer.find(params[:customer_id])
    @real_estate = @customer.real_estate
    @appointments = @customer.appointments.order(date: "ASC", time: "ASC")
  end

  def show
    @customer = Customer.find(params[:customer_id])
    @real_estate = @customer.real_estate
    @appointment = Appointment.find(params[:id])
    #もっと簡潔なコードもあるそうだが、今回はあえてこのまま（何が足されているのか、可視化できた方がわかりやすいため）
    @total = @appointment.earnest_money + @appointment.brokerage_fee + @appointment.revenue_stamp_fee + @appointment.remaining_amount + @appointment.real_estate_tax + @appointment.registration_fee_1 + @appointment.registration_fee_2 + @appointment.renovation_fee + @appointment.apartment_management_fee + @appointment.other_expense_1 + @appointment.other_expense_2 + @appointment.other_expense_3 + @appointment.other_expense_4 + @appointment.other_expense_5
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @real_estate = @customer.real_estate
    @appointment = Appointment.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      #appointment_paramsを取得したデータに「set_time_date」の内容を下記で反映させ、改めてsaveする
      @appointment.set_time_date
      @appointment.save
      flash[:notice] = "更新に成功しました。"
      redirect_to admin_customer_appointment_path(@customer)
    else
      flash.now[:alert] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    flash[:notice] = "削除処理を実行しました。"
    redirect_to admin_customer_appointments_path(@customer)
  end

  private

  def appointment_params
    params.require(:appointment).permit(
      :name,
      :date,
      :time,
      :place_name,
      :place_address,
      :description_1,
      :description_2,
      :preparation_thing,
      :earnest_money,
      :brokerage_fee,
      :revenue_stamp_fee,
      :remaining_amount,
      :real_estate_tax,
      :registration_fee_1,
      :registration_fee_2,
      :renovation_fee,
      :apartment_management_fee,
      :other_expense_1,
      :other_expense_2,
      :other_expense_3,
      :other_expense_4,
      :other_expense_5,
      :customer_id,
    )
  end
end

