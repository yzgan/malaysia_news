class Search < ApplicationRecord
  has_many :articles, dependent: :nullify
end
