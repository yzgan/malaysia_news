# frozen_string_literal: true

# app/services/google/google_cloud_language.rb
module Google
  class GoogleCloudLanguage < ApplicationService
    attr_reader :response

    def initialize
      @client = ::Google::Cloud::Language.language_service
    end

    def classify(text)
      @request = ::Google::Cloud::Language::V1::ClassifyTextRequest.new document: { type: :PLAIN_TEXT, content: text }
      @response = @client.classify_text @request
    end
  end
end
