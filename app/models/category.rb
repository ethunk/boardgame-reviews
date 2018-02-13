class Category < ApplicationRecord
  GENRES = ["Action", "Card Game", "Bluffing", "Strategy", "Humor", "Fantasy", "Memory", "Cooperative", "Puzzle", "Dice"]
  validates :category, inclusion: { in: GENRES }
  belongs_to :board_games
  belongs_to :categorizations
end
