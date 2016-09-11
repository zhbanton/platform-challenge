class MenuItem
  include Mongoid::Document
  field :name, type: String
  field :description, type: String

  belongs_to :brand
  embeds_many :prices

  accepts_nested_attributes_for :prices

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

end
