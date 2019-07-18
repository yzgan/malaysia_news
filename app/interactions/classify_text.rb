class ClassifyText < ActiveInteraction::Base
  record :article

  set_callback :execute, :before do
    errors.merge!(article.errors) unless article.valid?
  end

  def execute
    TextClassificationJob.perform_later article
  end
end
