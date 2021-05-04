json.extract! recipe_type, :id, :name, :description, :created_at, :updated_at
json.url recipe_type_url(recipe_type, format: :json)
