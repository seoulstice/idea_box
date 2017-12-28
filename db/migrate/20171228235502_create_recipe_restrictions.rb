class CreateRecipeRestrictions < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_restrictions do |t|
      t.references :recipe, foreign_key: true
      t.references :restriction, foreign_key: true
    end
  end
end
