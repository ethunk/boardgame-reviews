class Review < ApplicationRecord
  belongs_to :user
  belongs_to :boardgame
  has_many :votes

  validates :body, presence: true
  validates :user, presence: true
  validates :rating, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }
end
