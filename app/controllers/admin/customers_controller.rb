class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:notice] = "登録に成功しました。"
      redirect_to admin_root_path
    else
      flash.now[:alert] = "登録に失敗しました。"
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
      flash[:notice] = "更新に成功しました。"
      redirect_to admin_customer_path(@customer)
    else
      flash.now[:alert] = "更新に失敗しました。"
      render :edit
    end
  end

  def search
    @customers = Customer.search(params[:keyword]).page(params[:page]).per(20)
    @keyword = params[:keyword]
    render template: "admin/homes/top"
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
