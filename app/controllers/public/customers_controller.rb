class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
    else
    render :edit
    end
  end

  def unsubscribe
    @customer = Customer.find(params[:customer_id])
  end

  def withdraw
    @customer = Customer.find(params[:customer_id])
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
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
      :status,
      :password,
      :password_confirmation,
    )
  end
end
