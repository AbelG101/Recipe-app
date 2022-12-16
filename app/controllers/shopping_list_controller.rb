class ShoppingListController < ApplicationController
  def index
    @shopping_lists = RecipeFood.where(recipe_id: params[:id]).includes(:food)
  end
end
