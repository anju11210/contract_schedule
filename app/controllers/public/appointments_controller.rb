class Public::AppointmentsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customer = Customer.find(params[:customer_id])
    #
    @appointments = @customer.appointments.where("date >= ?", Date.today)
    @question = Question.new
    @real_estate = @customer.real_estate
  end

  def show
    @customer = Customer.find(params[:customer_id])
    @appointment = Appointment.find(params[:id])
    @question = Question.new
    @real_estate = @customer.real_estate
    @total = @appointment.earnest_money + @appointment.brokerage_fee + @appointment.revenue_stamp_fee + @appointment.remaining_amount + @appointment.real_estate_tax + @appointment.registration_fee_1 + @appointment.registration_fee_2 + @appointment.renovation_fee + @appointment.apartment_management_fee + @appointment.other_expense_1 + @appointment.other_expense_2 + @appointment.other_expense_3 + @appointment.other_expense_4 + @appointment.other_expense_5
  end
end
