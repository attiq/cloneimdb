class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.integer :category_id
      t.string :title
      t.text :description
      t.text :image_data

      t.timestamps
    end
  end
end
