class Article < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_title, against: :title

  belongs_to :search
  belongs_to :resource

  validates :title, presence: true, uniqueness: true

  def recent?
    Time.current - created_at < 2.hours
  end

  def valid_image_url?
    return false if url_to_image.nil?
    url_to_image.match? URI.regexp(%w[http https])
  end
end
