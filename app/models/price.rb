class Price
  include Mongoid::Document
  field :cost, type: Money

  embedded_in :menu_item
  belongs_to :price_level

  validates :price_level, presence: true
  validates :cost, numericality: { greater_than_or_equal_to: 0 }
end
