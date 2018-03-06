class CreateBoardgames < ActiveRecord::Migration[5.1]
  def change
    create_table :boardgames do |t|
      t.belongs_to :user, null: false
      t.string :name, null: false
      t.string :description, null: false
      t.string :publisher, null: false
      t.decimal :average_rating

      t.timestamps null: false
    end
  end
end
