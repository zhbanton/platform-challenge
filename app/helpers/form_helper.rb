module FormHelper

  def setup_menu_item(brand, menu_item)
    (brand.price_levels.map(&:id) - menu_item.prices.map(&:price_level_id)).each do |price_level_id|
      menu_item.prices.build(price_level_id: price_level_id)
    end
    [brand, menu_item]
  end

end
