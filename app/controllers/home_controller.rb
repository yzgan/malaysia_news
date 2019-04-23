class HomeController < ApplicationController
  before_action :set_datetime_and_year, only: %i[index search]
  before_action :set_greeting, only: %i[index search]

  def index
    @articles = Article.order(created_at: :desc).page(params[:page])
  end

  def search
    @articles = Article.search_by_title(params[:search]).page(params[:page])
    render :index
  end

  def top_headlines
    render json: NewsApiServices.new.top_headlines
  end

  private

    def set_datetime_and_year
      @time = Time.current
      @year = @time.year
    end

    # TODO: Code refactoring
    # rubocop:disable Metrics/MethodLength
    def set_greeting
      @greeting = {}
      case
      when @time < @time.beginning_of_day + 6.hours || @time >= @time.at_noon + 10.hours
        @greeting[:message] = 'Good Night'
        @greeting[:image_url] = ActionController::Base.helpers.asset_path('klcc-night')
      when @time < @time.at_noon
        @greeting[:message] = 'Good Morning'
        @greeting[:image_url] = ActionController::Base.helpers.asset_path('klcc')
      when @time < @time.at_noon + 6.hours
        @greeting[:message] = 'Good Afternoon'
        @greeting[:image_url] = ActionController::Base.helpers.asset_path('klcc-day')
      when @time < @time.at_noon + 10.hours
        @greeting[:message] = 'Good Evening'
        @greeting[:image_url] = ActionController::Base.helpers.asset_path('klcc-evening')
      else
        @greeting[:message] = 'Good Day'
        @greeting[:image_url] = ActionController::Base.helpers.asset_path('klcc')
      end
    end
  # rubocop:enable Metrics/MethodLength
end
