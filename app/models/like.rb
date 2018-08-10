class Like < ApplicationRecord
belongs_to :chef
belongs_to :recipe

#arranges for a chef(chef_id) to only like/dislike(associate) a recipe once.
validates_uniqueness_of :chef, scope: :recipe 

end