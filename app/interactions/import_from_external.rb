class ImportFromExternal < ActiveInteraction::Base
  object :data, class: ActiveSupport::HashWithIndifferentAccess
  symbol :type

  attr_reader :search

  def execute
    Search.transaction do
      import_to_search_database
      import_to_article_database
    end
  end

  private

  def import_to_search_database
    @search = Search.create(status: data_status, total_results: data_total_results)
  end

  def import_to_article_database
    Article.transaction do
      data_articles.map do |data_article|
        resource_data = data_article.delete(:source)
        resource = Resource.find_or_create_by(name: resource_data.dig(:name)) do |record|
          record.source_id = resource_data.dig(:id)
        end
        article_params = data_article.transform_keys(&:underscore).transform_keys(&:to_sym)

        Article.create(article_params.merge(search: search, resource: resource))
      end
    end
  end

  def data_status
    data.dig(:status).to_sym
  end

  def data_total_results
    data.dig('totalResults').to_i
  end

  def data_articles
    data.dig(:articles)
  end
end
