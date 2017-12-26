require "searchlight/adapters/action_view"

class IdeaSearch < Searchlight::Search
  include Searchlight::Adapters::ActionView
  def base_query
    Idea.includes(:category, :idea_images)
  end

  def search_category_id
    query.where(category_id: options[:category_id])
  end

  def search_idea_image
    query.where(idea_images_id: options[:idea_images_id])
  end

  def search_by_term
    query.where(term: options[:term])
  end

end
