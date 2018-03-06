class BoardgamesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @boardgames = Boardgame.all.order('created_at DESC').page(params[:page])
  end

  def new
    @boardgame = Boardgame.new
  end

  def show
    @boardgame = Boardgame.find(params[:id])
    @reviews = @boardgame.reviews.order(created_at: :desc).page(params[:page])
    @review = Review.new
    @rating = Review::RATINGS
    @vote_total = Vote.group(:review_id).sum(:vote)
  end

  def create
    @boardgame = Boardgame.new(boardgame_params)
    @boardgame.user = current_user

    if @boardgame.save
      flash[:notice] = "Boardgame Created!"
      redirect_to boardgames_path
    else
      flash.now[:alert] = @boardgame.errors.full_messages.join("\n")
      render :new
    end
  end

  def edit
    @boardgame = Boardgame.find(params[:id])
  end

  def update
    @boardgame = Boardgame.find(params[:id])

    if @boardgame.update(boardgame_params)
      flash[:notice] = 'Boardgame Edited'
      redirect_to boardgame_path(@boardgame)
    else
      flash.now[:alert] = @boardgame.errors.full_messages.join("\n")
      render :edit
    end
  end

  def destroy
    @boardgame = Boardgame.find(params[:id]).destroy
    flash[:notice] = "Boardgame Deleted"
    redirect_to boardgames_path
  end

end


private

def boardgame_params
  params.require(:boardgame).permit(:name, :description,
    :publisher, :user_id)
end
