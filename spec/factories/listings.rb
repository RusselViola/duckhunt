FactoryGirl.define do
  factory :listing do
    sequence(:name) { |n| "MyStr#{n}ng" }
    sequence(:description) { |n| "MyT#{n}xt" }
    sequence(:price) { |n| "9.#{n}9" }
  end
end
