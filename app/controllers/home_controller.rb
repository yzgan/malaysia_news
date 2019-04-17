class HomeController < ApplicationController
  def index
    @articles = Article.all
  end

  def top_headlines
    render json: NewsApiServices.new.top_headlines
  end
end
