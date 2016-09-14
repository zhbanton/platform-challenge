class OrderType
  include Mongoid::Document
  include PriceLevelAssociationDeletion
  field :name, type: String

  belongs_to :brand

  validates :name, presence: true
  validates :brand, presence: true

  after_destroy :delete_price_level_associations
end
