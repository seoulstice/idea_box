module CollectionsHelper

  def categories_collection
    @categories_collection ||= Category.all.map {|cat| [cat.classification, cat.id]}
  end

  def ingredients_collection
    @ingredients_collection ||= Ingredient.all.map { |ingredient| [ingredient.body, ingredient.id]}
  end
end
