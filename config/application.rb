require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MalaysiaNewsApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.time_zone = 'Kuala Lumpur'
    config.active_record.default_timezone = :local
    config.external_application_services = true
    config.dsn = 'https://32cbd8b9c85340569b21a3934069555c:4d6cf83338c24b1880dbace4b44a669d@sentry.io/1877080'
    config.filter_parameters << :password
  end
end
