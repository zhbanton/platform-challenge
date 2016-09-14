class DayPart
  include Mongoid::Document
  include PriceLevelAssociationDeletion
  field :name, type: String

  belongs_to :location

  validates :name, presence: true

  after_destroy :delete_price_level_associations

  def brand
    location.brand
  end
end
