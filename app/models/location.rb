class Location
  include Mongoid::Document
  field :name, type: String
  field :address, type: String

  belongs_to :brand
  has_many :day_parts, dependent: :destroy
  embeds_many :price_level_associations

  accepts_nested_attributes_for :price_level_associations, allow_destroy: true, reject_if: :all_blank

  validates :name, presence: true

  # price_level_associations: [
  #   {
  #     order_type: 1,
  #     day_part: 1,
  #     price_level: 2
  #   },
  #   {
  #     order_type: 2,
  #     day_part: 2,
  #     price_level: 1
  #   },
  #   {
  #     order_type: 2,
  #     price_level: 1
  #   }
  # ]
end
