require 'rails_helper'

describe PriceLevel do
  describe 'after deletion' do
    let(:brand) { create(:brand) }
    let(:price_level) { create(:price_level, brand: brand) }
    subject { price_level.destroy }
    context 'with associated prices' do
      let(:menu_item) { create(:menu_item, brand: brand) }
      let!(:price) { create(:price, menu_item: menu_item, price_level: price_level) }
      it 'should delete all associated prices' do
        expect { subject }.to change { menu_item.prices.count }.by(-1)
      end
    end
    context 'with associated price associations' do
      let(:location) { create(:location, brand: brand) }
      let(:order_type) { create(:order_type, brand: brand) }
      let(:day_part) { create(:day_part) }
      let!(:pla) { create(:price_level_association, location: location, price_level: price_level, order_type: order_type, day_part: day_part)}
      it 'should delete all associated price associations' do
        expect { subject }.to change { location.price_level_associations.count }.by(-1)
      end
    end
  end
end
