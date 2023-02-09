class Admin::HomesController < ApplicationController
  def top
    @customers = Customer.all
    # @customer = Customer.find(params[:customer_id])
  end
end
