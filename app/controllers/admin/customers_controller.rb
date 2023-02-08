class Admin::CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to admin_root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def customer_params
    params.require(:customer).permit(
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :address,
      :phone_number,
      :email,
      :password,
      :password_confirmation,
    )
  end
end