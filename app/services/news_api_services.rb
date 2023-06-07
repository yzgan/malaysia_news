class NewsApiServices < ApiServices
  class NewsApiError < StandardError; end

  BASE_URI = 'https://newsapi.org/v2/'.freeze

  attr_reader :top_headlines_uri

  def initialize
    @api = HTTParty
    @api_key = Rails.application.credentials.news_api
    super(api, api_key)
  end

  def top_headlines
    response = get top_headlines_uri, country: 'my'
    raise NewsApiError, response.dig('message') if response.dig('status') == 'error'

    response
  end

  def search(keyword = 'malaysia', language: 'en')
    get search_uri, language: language, q: keyword
  end

  private

  def top_headlines_uri
    BASE_URI + 'top-headlines'
  end

  def search_uri
    BASE_URI + 'everything'
  end
end
