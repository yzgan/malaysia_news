class TextClassificationJob < ApplicationJob
  queue_as :default

  discard_on Google::Gax::RetryError

  def perform(article)
    response = Google::GoogleCloudLanguage.new.classify article.content
    category = response.to_h.dig(:categories, 0, :name)
    article.update(category: category)
  end
end
