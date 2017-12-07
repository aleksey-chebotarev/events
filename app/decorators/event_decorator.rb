class EventDecorator < ApplicationDecorator
  delegate_all

  def custom_start_date
    object.start_date.strftime('%d.%m.%Y в %H:%M')
  end

  def full_address
    "#{object.city_name}, #{object.place_address}"
  end

  def full_region
    "#{object.region_number}, #{object.region_name}"
  end
end
