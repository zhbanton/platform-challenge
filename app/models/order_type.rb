class OrderType
  include Mongoid::Document
  field :name, type: String

  belongs_to :brand

  validates :name, presence: true
end
