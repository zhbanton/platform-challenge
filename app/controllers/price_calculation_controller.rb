class PriceCalculationController < ApplicationController

  def new
    @brands = Brand.all
    @brand = @brands.first
  end

  def create
    brand = Brand.find(params[:brand_id])
    menu_item = brand.menu_items.find(params[:menu_item_id])
    location = brand.locations.find(params[:location_id])
    price_calculator = PriceCalculator.new(menu_item: menu_item, location: location, order_type_id: params[:order_type_id], day_part_id: params[:day_part_id])
    begin
      @response = { success: true, price: price_calculator.run }
    rescue PriceCalculator::NoPriceFoundError => e
      @response = { success: false, message: e.message }
    end
  end

end
