class Resource < ApplicationRecord
  include Cleanable

  has_many :articles, dependent: :nullify

  validates :name, uniqueness: true
end
