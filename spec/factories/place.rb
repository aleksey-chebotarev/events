FactoryBot.define do
  factory :place do
    title   { FFaker::Lorem.sentence }
    address { FFaker::Address.street_address }
  end
end
