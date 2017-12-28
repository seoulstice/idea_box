module CollectionsHelper

  def categories_collection
    @categories_collection ||= Category.all.map {|c| [cat.classification, cat.id]}
  end
end
