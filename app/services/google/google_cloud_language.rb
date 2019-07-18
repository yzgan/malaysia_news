# frozen_string_literal: true

# app/services/google/google_cloud_language.rb
module Google
  class GoogleCloudLanguage < ApplicationService
    attr_reader :response

    def initialize(credential: Rails.application.credentials.google[:gcloud])
      @language = Google::Cloud::Language.new(credentials: credential)
    end

    def classify(text)
      @response = @language.classify_text content: text, type: :PLAIN_TEXT
    end
  end
end
