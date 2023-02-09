class Public::AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
    @question = Question.new
  end

  def show
  end
end
