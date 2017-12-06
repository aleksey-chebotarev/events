require 'icalendar'

class IcsService
  def initialize(event)
    @event = event
  end

  def start
    cal = Icalendar::Calendar.new

    cal.event do |e|
      e.dtstart     = start_date
      e.dtend       = start_date
      e.summary     = @event.title
      e.description = @event.description
      e.location    = location
    end

    cal.publish
    cal.to_ical
  end

  def filename
    "#{@event.title.gsub(/[^0-9A-Z]/i, '_')}.ics"
  end

  private

  def start_date
    @start_date = @event.start_date.to_datetime
  end

  def location
    "#{@event.city_name}, #{@event.place_address}"
  end
end
