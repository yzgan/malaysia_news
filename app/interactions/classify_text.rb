class ClassifyText < ActiveInteraction::Base
  string :text

  validates :text, presence: true, length: { minimum: 20 }

  def execute
    Google::GoogleCloudLanguage.new.classify text
  end
end
