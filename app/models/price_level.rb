class PriceLevel
  include Mongoid::Document
  include PriceLevelAssociationDeletion
  field :name, type: String

  belongs_to :brand

  validates :name, presence: true

  after_destroy :delete_prices, :delete_price_level_associations

  private

    def delete_prices
      brand.menu_items.each do |menu_item|
        menu_item.prices.where(price_level: self).destroy_all
      end
    end

end
