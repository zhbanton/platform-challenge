class Price
  include Mongoid::Document
  field :cost, type: Float

  embedded_in :menu_item
  belongs_to :price_level

  validates :cost, presence: true
end
