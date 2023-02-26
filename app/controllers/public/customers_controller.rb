class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :thanks, except:[:show, :unsubscribe, :withdraw]

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "更新が成功しました。"
      redirect_to customer_path(@customer)
    else
      flash.now[:alert] = "更新に失敗しました。"
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
    flash[:notice] = "退会処理を実行しました。ご利用ありがとうございました。"
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

