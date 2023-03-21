class Public::AppointmentsController < ApplicationController
  before_action :authenticate_customer!
  before_action :thanks

  def index
    @customer = Customer.find(params[:customer_id])
    unless @customer.id == current_customer.id
      redirect_to root_path
    end
    @appointments = @customer.appointments.where("date >= ? or date is null", Date.today).order(date: "ASC", time: "ASC")
    @question = Question.new
    @real_estate = @customer.real_estate
  end

  def show
    @customer = Customer.find(params[:customer_id])
    unless @customer.id == current_customer.id
      redirect_to root_path
    end
    @appointment = Appointment.find(params[:id])
    @question = Question.new
    @real_estate = @customer.real_estate
    #@total = @appointment.earnest_money + @appointment.brokerage_fee + @appointment.revenue_stamp_fee + @appointment.remaining_amount + @appointment.real_estate_tax + @appointment.registration_fee_1 + @appointment.registration_fee_2 + @appointment.renovation_fee + @appointment.apartment_management_fee + @appointment.other_expense_1 + @appointment.other_expense_2 + @appointment.other_expense_3 + @appointment.other_expense_4 + @appointment.other_expense_5
    @total = @appointment.total_money
  end
end

