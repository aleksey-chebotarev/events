FactoryBot.define do
  factory :event do
    title       { FFaker::Lorem.sentence }
    description { FFaker::Lorem.paragraph }
    cover       { File.new(Rails.root.join('app', 'assets', 'images', 'default-cover.png')) }
    start_date  { DateTime.now }

    association :region, factory: :region
    association :city, factory: :city
    association :organizer, factory: :organizer
    association :place, factory: :place
  end
end
