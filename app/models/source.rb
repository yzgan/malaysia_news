class Source < ApplicationRecord
  has_many :articles, dependent: :nullify

  validates :name, uniqueness: true
end
