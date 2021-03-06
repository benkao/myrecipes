class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500, minimum: 5}
  belongs_to :chef
  validates :chef_id, presence: true
  default_scope -> {order(updated_at: :desc)} #latest recipe shows first
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :comments, dependent: :destroy #when the recipe was deleted, the comment(s) would be deleted as well
  has_many :likes, dependent: :destroy
  
  def thumbs_up_total
    self.likes.where(like: true).size
  end
  
  def thumbs_down_total
    self.likes.where(like: false).size
  end
  
  mount_uploader :image, ImageUploader
  
end

