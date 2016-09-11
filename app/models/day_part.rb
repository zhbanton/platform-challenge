class DayPart
  include Mongoid::Document
  field :name, type: String

  belongs_to :location

  validates :name, presence: true
end
