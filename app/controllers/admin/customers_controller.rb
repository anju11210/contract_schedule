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
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
    else
    render :edit
    end
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
      :is_active,
      :status,
      :password,
      :password_confirmation,
    )
  end
end