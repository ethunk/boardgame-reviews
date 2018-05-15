class Boardgame < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :publisher, presence: true

  has_many :reviews, dependent: :destroy
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations
  accepts_nested_attributes_for :categorizations
  belongs_to :user

  mount_uploader :boardgame_photo, BoardgamePhotoUploader
  validate :image_size_validation

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


 private
   def image_size_validation
     errors[:image] << "should be less than 500KB" if boardgame_photo.size > 0.5.megabytes
   end

end
