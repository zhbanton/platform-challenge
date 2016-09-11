class PriceCalculator

  class NoPriceFoundError < StandardError
    def initialize
      super('No price found for given inputs')
    end
  end

  def initialize(menu_item:, location:, order_type_id:, day_part_id:)
    @menu_item = menu_item
    @location = location
    @order_type_id = order_type_id
    @day_part_id = day_part_id
  end

  def run
    raise NoPriceFoundError.new if price_level.nil?
    @menu_item.prices.find_by(price_level_id: price_level.id).cost
  end

  private

    def price_level
      @price_level ||= price_level_with_day_part || price_level_without_day_part
    end

    def price_level_with_day_part
      @location.price_level_associations.where(day_part_id: @day_part_id, order_type_id: @order_type_id).first.try(:price_level)
    end

    def price_level_without_day_part
      @location.price_level_associations.where(order_type_id: @order_type_id).first.try(:price_level)
    end

end
