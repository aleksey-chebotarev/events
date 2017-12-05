FactoryBot.define do
  factory :organizer do
    title       { FFaker::Lorem.sentence }
    description { FFaker::Lorem.paragraph }
  end
end
