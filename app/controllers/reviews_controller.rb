class ReviewsController < ApplicationController


  def new
    @review = Review.new
    @boardgame = Boardgame.find(params[:boardgame_id])
    @rating = Review::RATINGS
  end

  def edit
    @review = Review.find(params[:id])
    @boardgame = @review.boardgame
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

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      flash[:notice] = 'Review Edited'
      redirect_to boardgame_path(@review.boardgame)
    else
      flash.now[:alert] = @review.errors.full_messages.join("\n")
      @rating = Review::RATINGS
      render :edit
    end
  end

  def destroy
    @boardgame = Boardgame.find(params[:boardgame_id]).destroy
    flash[:notice] = "Boardgame Deleted"
    redirect_to boardgames_path
  end


end


private

def review_params
  params.require(:review).permit(:body, :rating, :boardgame_id, :user_id)
end
