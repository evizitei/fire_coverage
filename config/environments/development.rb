HOST = 'localhost'

Fire_coverage::Application.configure do
  config.cache_classes               = false
  config.whiny_nils                  = true
  config.consider_all_requests_local = true

  config.action_view.debug_rjs               = true
  config.action_controller.perform_caching   = false
  config.active_support.deprecation          = :log
  config.action_mailer.raise_delivery_errors = false
  
  config.after_initialize do
    Moonshado::Sms.configure do |config|
      config.production_environment = false
    end
  end
end