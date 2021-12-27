Google::Cloud::Language.configure do |config|
  config.credentials = Rails.application.credentials.google[:gcloud]
end
