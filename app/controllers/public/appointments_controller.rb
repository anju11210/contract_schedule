class Public::AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
    @question = Question.new
  end

  def show
    @appointment = Appointment.find(params[:id])
    @total = @appointment.earnest_money + @appointment.brokerage_fee + @appointment.revenue_stamp_fee + @appointment.remaining_amount + @appointment.real_estate_tax + @appointment.registration_fee_1 + @appointment.registration_fee_2 + @appointment.renovation_fee + @appointment.apartment_management_fee + @appointment.other_expense_1 + @appointment.other_expense_2 + @appointment.other_expense_3 + @appointment.other_expense_4 + @appointment.other_expense_5
  end
end
