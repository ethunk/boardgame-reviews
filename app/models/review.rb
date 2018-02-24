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

RATINGS = [
  ['Choose a Rating',0],
  ['1-Not Fun',1],
  ["2",2],
  ['3-Avg',3],
  ['4',4],
  ['5-Best',5]
  ]
