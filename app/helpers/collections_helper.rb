module CollectionsHelper

  def categories_collection
    @categories_collection ||= Category.all.map {|cat| [cat.classification, cat.id]}
  end

  def term_collection
    @term_collection ||= ["Vegan", "Vegetarian", "Paleo", "Gluten-Free"]
  end
end
