FactoryBot.define do
  factory :subscriber do
    email { FFaker::Internet.email }
  end
end
