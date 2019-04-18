class HomeController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc).decorate
  end

  def top_headlines
    render json: NewsApiServices.new.top_headlines
  end
end
