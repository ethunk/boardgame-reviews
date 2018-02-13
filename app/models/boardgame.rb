class Boardgame < ApplicationRecord
  validates :title, presence: true
  # has_many :reviews
  belongs_to :categorizations

end
