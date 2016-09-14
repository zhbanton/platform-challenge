require 'rails_helper'

describe PriceCalculator do
  let(:brand) { create(:brand) }
  let(:location) { create(:location, brand: brand) }
  let(:order_type) { create(:order_type, brand: brand) }
  let(:menu_item) { create(:menu_item, brand: brand) }
  let(:day_part) { create(:day_part, location: location) }
  let(:price_level) { create(:price_level, brand: brand) }
  let!(:price) { create(:price, menu_item: menu_item, price_level: price_level, cost: Money.new(1000, 'USD')) }
  subject { PriceCalculator.new(menu_item: menu_item, location: location, order_type_id: order_type.id, day_part_id: day_part.id).run }
  describe 'with price level association for location, order type and day part' do
    let(:price_level2) { create(:price_level, brand: brand) }
    let(:day_part2) { create(:day_part, location: location) }
    let!(:pla) { create(:price_level_association, location: location, price_level: price_level, order_type: order_type, day_part: day_part) }
    let!(:pla2) { create(:price_level_association, location: location, price_level: price_level2, order_type: order_type, day_part: day_part2) }
    let!(:price2) { create(:price, menu_item: menu_item, price_level: price_level2, cost: Money.new(500, 'USD')) }
    it 'should use price level with day part' do
      expect(subject.cents).to eql(1000)
    end
  end
  describe 'with price level association for location and order type but not day part' do
    let(:day_part2) { create(:day_part, location: location) }
    let!(:pla) { create(:price_level_association, location: location, price_level: price_level, order_type: order_type, day_part: day_part2) }
    it 'should use price level with location and order type' do
      expect(subject.cents).to eql(1000)
    end
  end
  describe 'with price level association for location and day part but not order type' do
    let(:order_type2) { create(:order_type, brand: brand) }
    let!(:pla) { create(:price_level_association, location: location, price_level: price_level, order_type: order_type2, day_part: day_part) }
    it 'should raise NoPriceFoundError' do
      expect { subject }.to raise_error(PriceCalculator::NoPriceFoundError)
    end
  end
end
