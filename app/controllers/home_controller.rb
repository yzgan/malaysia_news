class HomeController < ApplicationController
  def index
  end

  def top_headlines
    render json: NewsApiServices.new.top_headlines
  end
end
