module CollectionsHelper

  def genres_collection
    @genres_collection ||= Genre.all.map {|genre| [genre.classification, genre.id]}
  end

end
