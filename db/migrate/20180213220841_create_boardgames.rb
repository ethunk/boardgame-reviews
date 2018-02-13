class CreateBoardgames < ActiveRecord::Migration[5.1]
  def change
    create_table :boardgames do |t|
      t.belongs_to :user
      t.string :name, null: false
      t.string :description, null: false
      t.string :publisher, null: false
      t.decimal :rating_average

      t.timestamps null: false
      t.timestamps
    end
  end
end
