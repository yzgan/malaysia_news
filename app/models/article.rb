class Article < ApplicationRecord
  belongs_to :search
  belongs_to :resource

  validates :title, presence: true, uniqueness: true

  def recent?
    Time.current - created_at < 2.hours
  end
end
