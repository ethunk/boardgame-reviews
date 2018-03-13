class AddPhotoToBoardgame < ActiveRecord::Migration[5.1]
  def change
    add_column :boardgames, :boardgame_photo, :string
  end
end
