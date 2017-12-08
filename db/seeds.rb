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

organizer = Organizer.create!(
  title: FFaker::Lorem.sentence,
  description: FFaker::Lorem.paragraph
)

puts "Organizer #{organizer.title} was created"

regions.each do |n|
  region = Region.create!(
    number: n[:number],
    name: n[:name]
  )

  puts "Region #{region.name} was created"

  cities.each do |city|
    next unless city[region.number].present?

    city = City.create!(
      name: city[region.number][:name],
      region_id: region.id
    )

    puts "City #{city.name} was created"

    10.times.each do |k|
      event = Event.new(
        title:         FFaker::Lorem.sentence,
        description:   FFaker::Lorem.paragraph,
        cover:         File.new(Rails.root.join('app', 'assets', 'images', 'default-cover.png')),
        start_date:    (
          if k.even?
            FFaker::Time.between(Time.now-3.months, Time.now-1.days)
          else
            FFaker::Time.between(Time.now+1.days, Time.now+3.months)
          end
        ),
        external_link: FFaker::Internet.http_url,
        region_id:     region.id,
        city_id:       city.id
      )
      event.organizer = Organizer.offset(rand(Organizer.count)).first
      event.place     = Place.create!(
        title:   FFaker::Lorem.sentence,
        address: FFaker::Address.street_address
      )
      event.save!

      puts "Event #{event.title} was created"
    end
  end
end
