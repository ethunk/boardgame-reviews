class Categorization < ApplicationRecord
  has_many :boardgame_id
  has_many :category_id
end
