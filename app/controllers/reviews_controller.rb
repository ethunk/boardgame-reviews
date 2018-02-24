class ReviewsController < ApplicationController


  def new
    @review = Review.new
    @rating = Review::RATINGS
  end

  def create
    @boardgame = Boardgame.find(params[:boardgame_id])
    @review = Review.new(review_params)
    @review.boardgame = @boardgame
    @review.user = current_user
    @reviews = @boardgame.reviews.order(created_at: :desc).page(params[:page])

    if @review.save
      flash[:notice] = "Review Created!"
      redirect_to boardgame_path(params[:boardgame_id])
    else
      flash[:alert] = @review.errors.full_messages.join(". ")
      redirect_to new_boardgame_review_path(@boardgame)
    end
  end

end


private

def review_params
  params.require(:review).permit(:body, :rating, :boardgame_id, :user_id)
end
