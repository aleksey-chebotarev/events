require 'ffaker'

regions = [
  { number: 04, name: 'Алтай' },
  { number: 61, name: 'Ростов' },
  { number: 62, name: 'Рязань' },
  { number: 91, name: 'Крым' }
]

regions.each do |n|
  region = Region.create!(
    number: n[:number],
    name: n[:name]
  )

  puts "Region #{region.name} was created"
end
