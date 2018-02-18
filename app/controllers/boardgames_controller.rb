class BoardgamesController < ApplicationController

  def index
    @boardgames = Boardgame.all.order('created_at DESC').page(params[:page])
  end

  def new
    @boardgame = Boardgame.new
  end

end


private

def boardgame_params
  params.require(:boardgame).permit(:name, :description,
    :publisher, :user_id, :city, :user_id)
end
