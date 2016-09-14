class DayPart
  include Mongoid::Document
  field :name, type: String

  belongs_to :location

  validates :name, presence: true
  validates :location, presence: true

  after_destroy :delete_price_level_associations

  private

    def delete_price_level_associations
      location.price_level_associations.where(day_part: self).destroy_all
    end

end
