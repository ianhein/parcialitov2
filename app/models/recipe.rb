class Recipe < ApplicationRecord
  belongs_to :category
  belongs_to :recipe_type
  belongs_to :author

  validates :name, presence: true, uniqueness: true
  validates :steps, presence: true
  validates :ingredients, presence: true
  validates :image_url, presence: true
end
