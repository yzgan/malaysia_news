class NewsApiServices < ApiServices
  BASE_URI = 'https://newsapi.org/v2/'.freeze

  attr_reader :top_headlines_uri

  def initialize
    @api = HTTParty
    @api_key = Rails.application.credentials.news_api
    super(api, api_key)
  end

  def top_headlines
    get top_headlines_uri, country: 'my'
  end

  private

    def top_headlines_uri
      BASE_URI + 'top-headlines'
    end
end
