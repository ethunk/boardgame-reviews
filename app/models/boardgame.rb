class Boardgame < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :publisher, presence: true
  has_many :reviews, dependent: :destroy
  has_many :categorizations
  has_many :categories, through: :categorizations
  belongs_to :user


  def avg_rating
    all_ratings = []
    if reviews.empty?
      return 0.0
    else
      reviews.each do |r|
        all_ratings << r.rating.to_f
      end
      (all_ratings.sum / all_ratings.length).round(1)
    end
  end

  paginates_per 5

end
