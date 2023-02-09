class Admin::AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    @customer = Customer.find(params[:customer_id])
  end

  def create
  end

  def index
    @appointments = Appointment.all
    @customer = Customer.find(params[:customer_id])
  end

  def show
  end

  def edit
  end

  def update
  end
end
