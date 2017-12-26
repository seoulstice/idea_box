class IdeaSearch < Searchlight::Search

  def base_query
    Idea.includes(:category, :idea_images)
  end

  def search_category_id
    query.where(category_id: options[:category_id])
  end

end
