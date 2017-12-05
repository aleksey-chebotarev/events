FactoryBot.define do
  factory :region do
    sequence(:number) { |n| n }
    sequence(:name) { |n| "Region ##{n}" }

    trait :several_cities do
      before(:create) do |region|
        region.cities = create_list :city, 2
      end
    end

    trait :several_events do
      before(:create) do |region|
        region.events = create_list :event, 2
      end
    end
  end
end
