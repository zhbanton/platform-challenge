class Brand
  include Mongoid::Document
  field :name, type: String

  has_many :locations, dependent: :destroy
  has_many :menu_items, dependent: :destroy
  has_many :order_types, dependent: :destroy
  has_many :price_levels, dependent: :destroy

  validates :name, presence: true
end
