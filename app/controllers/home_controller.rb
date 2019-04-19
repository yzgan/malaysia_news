class HomeController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc).page(params[:page])
  end

  def top_headlines
    render json: NewsApiServices.new.top_headlines
  end
end
