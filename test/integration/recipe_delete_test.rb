require 'test_helper'

class RecipeDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname: 'Ben', email: "a@h.com")
    @recipe = Recipe.create(name: "veg saute", description: "great veg saute with oil", chef: @chef)
  end

  test "successfully delete a recipe" do
    get recipe_path(@recipe)
    assert_template 'recipes/show'
    assert_select 'a[href=?]', recipe_path(@recipe), text: "Delete this recipe"
    assert_difference 'Recipe.count', -1 do
      delete recipe_path(@recipe)
    end
    assert_redirected_to recipes_path
    assert_not flash.empty?
   end
  
end