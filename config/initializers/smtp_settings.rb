if Rails.env.production?
  Rails.application.configure do
    config.action_mailer.delivery_method = :smtp

    config.action_mailer.smtp_settings = {
      address:              'smtp.sendgrid.net',
      port:                 587,
      domain:               'heroku.com',
      user_name:            ENV['SENDGRID_USERNAME'],
      password:             '9h3617s0',
      authentication:       'plain',
      enable_starttls_auto: true
    }
  end
end
