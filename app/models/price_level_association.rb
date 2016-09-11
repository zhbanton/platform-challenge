class PriceLevelAssociation
  include Mongoid::Document

  embedded_in :location
  belongs_to :order_type
  belongs_to :day_part
  belongs_to :price_level
end
