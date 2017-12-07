FactoryBot.define do
  factory :user do
    email    { FFaker::Internet.email }
    password '111111'

    trait :as_admin do
      after(:create) { |user| user.add_role(:admin) }
    end
  end
end
