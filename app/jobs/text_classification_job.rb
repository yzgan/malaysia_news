class TextClassificationJob < ApplicationJob
  queue_as :default

  def perform(article)
    ClassifyText.run(article: article)
  end
end
