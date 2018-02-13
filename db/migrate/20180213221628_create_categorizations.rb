class CreateCategorizations < ActiveRecord::Migration[5.1]
  def change
    create_join_table :boardgames, :categories do |t|
      t.integer :boardgame_id, null: false
      t.integer :category_id, null: false
      t.timestamps
    end
  end
end
