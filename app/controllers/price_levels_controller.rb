class PriceLevelsController < ApplicationController
  before_action :set_brand

  def show
    @price_level = @brand.price_levels.find(params[:id])
  end

  def new
    @price_level = PriceLevel.new
  end

  def edit
    @price_level = @brand.price_levels.find(params[:id])
  end

  def create
    @price_level = @brand.price_levels.new(price_level_params)
    if @price_level.save
      redirect_to brand_path(@brand), notice: 'Price Level was successfully created.'
    else
      render :new
    end
  end

  def update
    @price_level = @brand.price_levels.find(params[:id])
    if @price_level.update(price_level_params)
      redirect_to brand_path(@brand), notice: 'Price Level was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    price_level = @brand.price_levels.find(params[:id])
    price_level.destroy
    redirect_to brand_path(@brand)
  end

  private
    def set_brand
      @brand = Brand.find(params[:brand_id])
    end

    def price_level_params
      params.require(:price_level).permit(:name)
    end
end
