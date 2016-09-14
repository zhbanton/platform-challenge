FactoryGirl.define do
  factory :brand do
    name 'Burger King'
  end

  factory :location do
    name 'Long Island City'
    address '12345 Vernon Blvd'
  end

  factory :menu_item do
    name 'Whopper'
    description 'tasty cheeseburger'
    brand nil
  end

  factory :order_type do
    name 'Delivery'
    brand nil
  end

  factory :price_level do
    name 'Early Bird Special'
    brand nil
  end

  factory :day_part do
    name 'Lunch'
    location nil
  end

  factory :price_level_association do
    location nil
    order_type nil
    price_level nil
    day_part nil
  end

  factory :price do
    cost Money.new(1000, 'USD')
    menu_item nil
  end
end
