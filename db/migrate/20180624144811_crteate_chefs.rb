class CrteateChefs < ActiveRecord::Migration[5.0]
  def change
    create_table :chefts do |t|
    t.string :chefname
    t.string :email
    t.timestamps
    end
  end
end
