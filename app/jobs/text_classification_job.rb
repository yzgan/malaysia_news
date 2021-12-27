class TextClassificationJob < ApplicationJob
  queue_as :default

  discard_on Google::Cloud::Error, Google::Cloud::InvalidArgumentError

  def perform(article)
    response = Google::GoogleCloudLanguage.new.classify article.content
    category = response.to_h.dig(:categories, 0, :name)
    article.update(category: category)
  end
end
