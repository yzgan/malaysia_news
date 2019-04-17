class Article < ApplicationRecord
  belongs_to :search
  belongs_to :source
end
