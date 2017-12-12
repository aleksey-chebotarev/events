class NotificationsMailer < ApplicationMailer
  def new_upcoming_events(events, recipient_email)
    @events = events

    mail(to: recipient_email, subject: 'New report')
  end
end
