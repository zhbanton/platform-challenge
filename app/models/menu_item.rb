class MenuItem
  include Mongoid::Document
  field :name, type: String
  field :description, type: String

  belongs_to :brand
  embeds_many :prices

  validates :name, presence: true

  # prices: [
  #   {
  #     price_level: 1,
  #     cost: 9.98
  #   },
  #   {
  #     price_level: 2,
  #     cost: 4.56
  #   }
  # ]
  #

  # def price(location, day_part, order_type)
  #   price_level = location.price_level_associations.find_by(day_part_id: day_part, order_type_id: order_type).try(:price_level) || location.price_level_associations.find_by(day_part_id: day_part).price_level
  #   price = prices.find(price_level: price_level).cost
  # end

end
