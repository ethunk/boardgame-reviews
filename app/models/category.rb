class Category < ApplicationRecord
  GENRES = ["Action", "Card Game", "Bluffing", "Strategy", "Humor", "Fantasy", "Memory", "Cooperative", "Puzzle", "Dice"]
  validates :name, inclusion: { in: GENRES }
  validates :name, presence: true
  has_many :categorizations
  has_many :boardgames, through: :categorizations
end
