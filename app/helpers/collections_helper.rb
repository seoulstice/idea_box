module CollectionsHelper

  def categories_collection
    @categories_collection ||= Category.all.map {|cat| [cat.classification, cat.id]}
  end
  
end