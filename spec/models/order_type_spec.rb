require 'rails_helper'

describe OrderType do
  describe 'after deletion' do
    let(:brand) { create(:brand) }
    let(:order_type) { create(:order_type, brand: brand) }
    let(:location) { create(:location, brand: brand) }
    let(:price_level) { create(:price_level, brand: brand) }
    let(:day_part) { create(:day_part, location: location) }
    let!(:pla) { create(:price_level_association, location: location, price_level: price_level, order_type: order_type, day_part: day_part)}
    subject { order_type.destroy }
    it 'should delete all associated price associations' do
      expect { subject }.to change { location.price_level_associations.count }.by(-1)
    end
  end
end
