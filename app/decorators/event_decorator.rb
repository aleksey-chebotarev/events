class EventDecorator < Draper::Decorator
  delegate_all

  def start_date
    object.start_date.strftime('%d.%m.%Y в %H:%M')
  end
end
