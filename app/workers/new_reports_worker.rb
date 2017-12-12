class NewReportsWorker
  include Sidekiq::Worker

  sidekiq_options queue: 'notifications'

  def perform
    days   = AppConfig.number_of_upcoming_days
    events = Event.events_upcoming(days).decorate

    Subscriber.pluck(:email).each do |recipient_email|
      NotificationsMailer.new_upcoming_events(events, recipient_email).deliver
    end
  end
end
