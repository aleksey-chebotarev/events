class EventDecorator < ApplicationDecorator
  delegate_all

  def start_date
    object.start_date.strftime('%d.%m.%Y в %H:%M')
  end

  def full_address
    "#{object.city_name}, #{object.place_address}"
  end
end
