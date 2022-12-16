class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity
      t.references :food, null: false, foreign_key: true, on_delete: :cascade
      t.references :recipe, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
