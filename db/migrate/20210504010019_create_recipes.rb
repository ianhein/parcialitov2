class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.boolean :featured
      t.text :ingredients
      t.text :steps
      t.datetime :submit_date
      t.string :image_url
      t.references :category, null: false, foreign_key: true
      t.references :recipe_type, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
