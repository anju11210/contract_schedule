class Admin::RealEstatesController < ApplicationController
  def new
    @real_estate = RealEstate.new
    #パスにidは必要ないが、customer_idは渡す必要があるため、formatで記述
    @customer = Customer.find(params[:format])
  end

  def create
    @customer = Customer.find(real_estate_params[:customer_id])
    @real_estate = RealEstate.new(real_estate_params)
    if @real_estate.save
      redirect_to admin_customer_appointments_path(@customer.id)
    else
      render :new
    end
  end

  def edit
    @real_estate = RealEstate.find(params[:id])
  end

  def update
    @real_estate = RealEstate.find(params[:id])
    if @real_estate.update(real_estate_params)
      redirect_to admin_customer_appointments_path(@real_estate.customer)
    else
      render :edit
    end
  end

  private

  def real_estate_params
    params.require(:real_estate).permit(
      :name,
      :address,
      :price,
      :customer_id,
    )
  end
end
