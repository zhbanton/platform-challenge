class OrderTypesController < ApplicationController
  before_action :set_brand

  def show
    @order_type = @brand.order_types.find(params[:id])
  end

  def new
    @order_type = OrderType.new
  end

  def edit
    @order_type = @brand.order_types.find(params[:id])
  end

  def create
    @order_type = @brand.order_types.new(order_type_params)
    if @order_type.save
      redirect_to brand_path(@brand), notice: 'Order Type was successfully created.'
    else
      render :new
    end
  end

  def update
    @order_type = @brand.order_types.find(params[:id])
    if @order_type.update(order_type_params)
      redirect_to brand_path(@brand), notice: 'Order Type was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    order_type = @brand.order_types.find(params[:id])
    order_type.destroy
    redirect_to brand_path(@brand)
  end

  private
    def set_brand
      @brand = Brand.find(params[:brand_id])
    end

    def order_type_params
      params.require(:order_type).permit(:name)
    end
end
