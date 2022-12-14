class ChangeCookingTimeToBeStringInRecipe < ActiveRecord::Migration[7.0]
  def up
    change_column :recipes, :preparation_time, :string
    change_column :recipes, :cooking_time, :string
  end

  def down
    change_column :recipes, :preparation_time, :float
    change_column :recipes, :cooking_time, :float
  end
end
