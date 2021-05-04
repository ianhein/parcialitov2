class Category < ApplicationRecord
  has_many :authors
  has_many :recipes

  # Validaciones
  # No dejar grabar nombres repetidos
  validates :name, uniqueness: { message: "No pueden existir dos recetas con el mismo nombre!" }\
  # Todas las validaciones de espacio en blanco en una sola línea.
  validates :name, :ingredients, :steps, :image_url, :category_id, :recipe_type_id, :author_id, presence: true
end
