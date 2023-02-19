class Public::HomesController < ApplicationController
  def top
    @customer = current_customer
  end

  def about
  end

  def thanks
    @customer = current_customer
  end
end
