require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env) if defined?(Bundler)

module Fire_coverage
  class Application < Rails::Application
    config.time_zone = 'UTC'
    config.encoding  = "utf-8"
    config.generators do |g|
      g.test_framework :rspec
    end
    config.after_initialize do
      ClearanceMailer.default_url_options[:host] = HOST
    end
  end
end
