require 'ffaker'

regions = [
  { number: 4, name: 'Алтай' },
  { number: 61, name: 'Ростов' },
  { number: 62, name: 'Рязань' },
  { number: 91, name: 'Крым' }
]

cities = [
  { 4 => { name: 'Алейск' } },
  { 4 => { name: 'Барнаул' } },
  { 4 => { name: 'Белокуриха' } },
  { 4 => { name: 'Бийск' } },

  { 61 => { name: 'Ростов-на-Дону' } },
  { 61 => { name: 'Гуково' } },
  { 61 => { name: 'Зерноград' } },
  { 61 => { name: 'Новочеркасск' } },

  { 62 => { name: 'Рязань' } },
  { 62 => { name: 'Сасово' } },
  { 62 => { name: 'Скопин' } },
  { 62 => { name: 'Спас-Клепики' } },

  { 91 => { name: 'Симферополь' } },
  { 91 => { name: 'Судак' } },
  { 91 => { name: 'Феодосия' } },
  { 91 => { name: 'Ялта' } }
]

regions.each do |n|
  region = Region.create!(
    number: n[:number],
    name: n[:name]
  )

  puts "Region #{region.name} was created"

  cities.each do |city|
    city = City.create!(
      name: city[region.number][:name],
      region_id: region.id
    )

    puts "City #{city.name} was created"
  end
end
