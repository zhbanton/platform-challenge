class OrderType
  include Mongoid::Document
  include PriceLevelAssociationDeletion
  field :name, type: String

  belongs_to :brand

  validates :name, presence: true

  after_destroy :delete_price_level_associations
end
