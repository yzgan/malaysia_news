class Search < ApplicationRecord
  include Cleanable

  has_many :articles, dependent: :nullify

  enum status: %i[error ok]
end
