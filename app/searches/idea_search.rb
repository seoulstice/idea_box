require "searchlight/adapters/action_view"

class IdeaSearch < Searchlight::Search
  include Searchlight::Adapters::ActionView

  def base_query
    Idea.includes(:category, :idea_images)
  end

  def search_category
    query.where(category: options[:category])
  end

  def search_term
    query.where(term: options[:term])
  end

  def search_body_like
    query.merge(Idea.body_like(options[:body_like]))
  end

end
