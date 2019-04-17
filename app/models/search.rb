class Search < ApplicationRecord
  has_many :articles, dependent: :nullify

  enum status: %i[error ok]
end
