module CollectionsHelper

  def categories_collection
    @categories_collection ||= Category.all.map {|cat| [cat.classification, cat.id]}
  end

  def term_collection
    @term_collection ||= ["Short-Term", "Long-Term", "Bucket-List"]
  end
end
