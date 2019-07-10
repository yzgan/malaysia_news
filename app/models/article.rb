class Article < ApplicationRecord
  include Cleanable
  include PgSearch
  pg_search_scope :search_by_title, against: :title

  belongs_to :search
  belongs_to :resource

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true, length: { minimum: 20 }

  after_create_commit :classify_article

  def recent?
    Time.current - created_at < 2.hours
  end

  def self.class_name
    self
  end

  def valid_image_url?
    return false if url_to_image.nil?

    url_to_image.match? URI.regexp(%w[http https])
  end

  def classify_article
    TextClassificationJob.perform_later self
  end
end
