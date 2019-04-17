class Source < ApplicationRecord
  has_many :article, dependent: :nullify
end
