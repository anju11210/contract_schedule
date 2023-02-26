class Public::HomesController < ApplicationController
  before_action :authenticate_customer!, only: :thanks

  def top
    @customer = current_customer
  end

  def about
  end

  def thanks
    @customer = current_customer
  end
end

