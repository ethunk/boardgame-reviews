class Boardgame < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :publisher, presence: true
  has_many :reviews
  has_many :categorizations
  has_many :categories, through: :categorizations
  # belongs_to :categorizations
  belongs_to :user

end
