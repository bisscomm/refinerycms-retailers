require "factory_girl"

FactoryGirl.define do
  factory :retailer, class: "Refinery::Retailers::Retailer" do
    sequence(:title) { |n| "refinery#{n}" }
    sequence(:address) { |n| "#{n} Refinery CMS st" }
  end
end