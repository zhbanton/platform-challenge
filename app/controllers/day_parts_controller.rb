class DayPartsController < ApplicationController
  before_action :set_location

  def show
    @day_part = @location.day_parts.find(params[:id])
  end

  def new
    @day_part = DayPart.new
  end

  def edit
    @day_part = @location.day_parts.find(params[:id])
  end

  def create
    @day_part = @location.day_parts.new(day_part_params)
    if @day_part.save
      redirect_to brand_location_path(@location.brand, @location), notice: 'Day Part was successfully created.'
    else
      render :new
    end
  end

  def update
    @day_part = @location.day_parts.find(params[:id])
    if @day_part.update(day_part_params)
      redirect_to brand_location_path(@location.brand, @location), notice: 'Day Part was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    day_part = @location.day_parts.find(params[:id])
    day_part.destroy
    redirect_to brand_location_path(@location.brand, @location)
  end

  private
    def set_location
      @location = Location.find(params[:location_id])
    end

    def day_part_params
      params.require(:day_part).permit(:name)
    end
end
