# frozen_string_literal: true

# app/services/google/google_cloud_language.rb
module Google
  class GoogleCloudLanguage
    attr_reader :response

    def initialize
      @language = Google::Cloud::Language.new
    end

    def classify(text)
      @response = @language.classify_text content: text, type: :PLAIN_TEXT
    end
  end
end
