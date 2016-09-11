class PriceLevelAssociation
  include Mongoid::Document

  embedded_in :location
  belongs_to :price_level
  belongs_to :order_type
  belongs_to :day_part

  validates :price_level, presence: true
  validates :order_type, presence: true
  validates :price_level_id, uniqueness: { scope: [:order_type_id, :day_part_id] }
end
