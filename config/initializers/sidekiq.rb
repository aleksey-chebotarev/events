require 'sidekiq'
require 'sidekiq/scheduler'

Sidekiq.configure_server do |config|
  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file(Rails.root.join('config', 'sidekiq_scheduler.yml'))
    Sidekiq::Scheduler.reload_schedule!
  end
end

Sidekiq.configure_server do |config|
  config.redis = { namespace: "events_#{ ENV['RAILS_ENV'] }" }
end

Sidekiq.configure_client do |config|
  config.redis = { namespace: "events_#{ ENV['RAILS_ENV'] }" }
end
