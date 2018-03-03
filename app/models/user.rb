class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :boardgames
  has_many :votes
  has_many :reviews

  after_destroy { |record|
    # Boardgame.destroy(record.boardgames.pluck(:id))
    Review.destroy(record.reviews.pluck(:id))
  }

  def admin?
    role == 'admin'
  end
end
