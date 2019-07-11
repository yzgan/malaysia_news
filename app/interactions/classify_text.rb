class ClassifyText < ActiveInteraction::Base
  record :article

  def execute
    response = Google::GoogleCloudLanguage.new.classify article.content
    category = response.to_h.dig(:categories, 0, :name)
    article.update(category: category)
  end
end
