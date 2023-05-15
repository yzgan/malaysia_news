Raven.configure do |config|
  if Rails.env.production?
    config.dsn = 'https://32cbd8b9c85340569b21a3934069555c:4d6cf83338c24b1880dbace4b44a669d@sentry.io/1877080'
  end
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
end
