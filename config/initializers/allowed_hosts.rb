Rails.application.config.hosts += ENV['ALLOWED_HOSTS'].to_s.split(",")
