class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500, minimum: 5}
end