class LocationsController < ApplicationController
  before_action :set_brand

  def show
    @location = @brand.locations.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def edit
    @location = @brand.locations.find(params[:id])
  end

  def create
    @location = @brand.locations.new(location_params)
    if @location.save
      redirect_to brand_path(@brand), notice: 'Location was successfully created.'
    else
      render :new
    end
  end

  def update
    @location = @brand.locations.find(params[:id])
    if @location.update(location_params)
      redirect_to brand_path(@brand), notice: 'Location was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    location = @brand.locations.find(params[:id])
    location.destroy
    redirect_to brand_path(@brand)
  end

  private
    def set_brand
      @brand = Brand.find(params[:brand_id])
    end

    def location_params
      params.require(:location).permit(:name, :address)
    end
end
