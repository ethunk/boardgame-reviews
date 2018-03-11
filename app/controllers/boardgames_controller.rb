class BoardgamesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @boardgames = Boardgame.all.order('created_at DESC').page(params[:page])
  end

  def new
    @boardgame = Boardgame.new
    @categories = Category::GENRES
    @categorization = Categorization.new
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
      categorization_params.require(:category_id).each do |category_id|
        if (category_id.to_i <= Category.all.count) && (category_id.to_i >0)
          Categorization.create(boardgame_id: @boardgame.id, category_id: category_id)
        end
      end
      flash[:notice] = "Boardgame Created!"
      redirect_to boardgames_path
    else
      flash.now[:alert] = @boardgame.errors.full_messages.join("\n")
      @categorization = Categorization.new
      render :new
    end
  end

  def edit
    @boardgame = Boardgame.find(params[:id])
  end

  def update
    @boardgame = Boardgame.find(params[:id])
    binding.pry
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
    :publisher)
end

def categorization_params
  params.require(:categorization).permit(category_id: [])
end
