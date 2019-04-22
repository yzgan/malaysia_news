class HomeController < ApplicationController
  before_action :set_year, only: %i[index]

  def index
    @articles = Article.order(created_at: :desc).page(params[:page])
  end

  def top_headlines
    render json: NewsApiServices.new.top_headlines
  end

  private

    def set_year
      @year = Date.current.year
    end
end
