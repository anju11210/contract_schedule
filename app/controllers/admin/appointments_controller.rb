class Admin::AppointmentsController < ApplicationController
  def new
    @customer = Customer.find(params[:customer_id])
    @appointment = Appointment.new
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to admin_customer_appointments_path(@customer.id)
    else
      render :new
    end
  end

  def index
    @customer = Customer.find(params[:customer_id])
    @appointments = Appointment.all
  end

  def show
    @customer = Customer.find(params[:customer_id])
    @appointment = Appointment.find(params[:id])
    @total = @appointment.earnest_money + @appointment.brokerage_fee + @appointment.revenue_stamp_fee + @appointment.remaining_amount + @appointment.real_estate_tax + @appointment.registration_fee_1 + @appointment.registration_fee_2 + @appointment.renovation_fee + @appointment.apartment_management_fee + @appointment.other_expense_1 + @appointment.other_expense_2 + @appointment.other_expense_3 + @appointment.other_expense_4 + @appointment.other_expense_5

  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @appointment = Appointment.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
    redirect_to admin_customer_appointment_path(@customer.id)
    else
    render :edit
    end
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
