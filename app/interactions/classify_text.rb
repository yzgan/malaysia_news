class ClassifyText < ActiveInteraction::Base
  record :article

  set_callback :execute, :before do
    errors.merge!(article.errors) unless article.valid?
  end

  def execute
    return article_classification_error unless valid_words_count?
    return unless Rails.application.config.external_application_services
    TextClassificationJob.perform_later article
  end

  private

  def article_classification_error
    errors.add :article, 'must have valid content words count for classification'
  end

  def valid_words_count?
    article.content.split(/\W+/).count > 20
  end
end
