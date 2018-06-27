class ChangeCheftsToChefs < ActiveRecord::Migration[5.0]
  def change
    rename_table :chefts, :chefs
  end
end
