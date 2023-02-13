class Admin::HomesController < ApplicationController
  def top
    @customers = Customer.all.page(params[:page]).per(20)
  end
end
