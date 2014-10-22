
FactoryGirl.define do
  factory :retailer, :class => Refinery::Retailers::Retailer do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

