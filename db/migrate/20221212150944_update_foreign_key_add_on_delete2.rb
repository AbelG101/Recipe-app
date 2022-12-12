class UpdateForeignKeyAddOnDelete2 < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key "foods", "users"
    remove_foreign_key "recipe_foods", "recipes"
    remove_foreign_key "recipe_foods", "foods"

    add_foreign_key "foods", "users", on_delete: :cascade
    add_foreign_key "recipe_foods", "recipes", on_delete: :cascade
    add_foreign_key "recipe_foods", "foods", on_delete: :cascade

  end
end
