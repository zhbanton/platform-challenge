class PriceCalculationController < ApplicationController

  before_action :set_brand

  def new
  end

  def create
    menu_item = @brand.menu_items.find(params[:menu_item_id])
    location = @brand.locations.find(params[:location_id])
    price_calculator = PriceCalculator.new(menu_item: menu_item, location: location, order_type_id: params[:order_type_id], day_part_id: params[:day_part_id])
    begin
      @response = { success: true, price: price_calculator.run }
    rescue PriceCalculator::NoPriceFoundError => e
      @response = { success: false, message: e.message }
    end
  end

  private

    def set_brand
      @brand = Brand.find(params[:brand_id])
    end

end
