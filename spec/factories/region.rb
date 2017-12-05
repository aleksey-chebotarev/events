FactoryBot.define do
  factory :region do
    sequence(:number) { |n| n }
    sequence(:name) { |n| "Region ##{n}" }
  end
end
