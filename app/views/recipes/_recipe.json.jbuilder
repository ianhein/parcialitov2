json.extract! recipe, :id, :name, :description, :featured, :ingredients, :steps, :submit_date, :image_url, :category_id, :recipe_type_id, :author_id, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
