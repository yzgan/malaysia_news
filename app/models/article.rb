class Article < ApplicationRecord
  belongs_to :search
  belongs_to :source

  validates :title, presence: true, uniqueness: true
end
