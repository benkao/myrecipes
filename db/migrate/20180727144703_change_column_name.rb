class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :recipe_ingredients, :ingreent_id, :ingredient_id
    
  end
end
