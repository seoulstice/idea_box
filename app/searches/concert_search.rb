require "searchlight/adapters/action_view"

class ConcertSearch < Searchlight::Search
  include Searchlight::Adapters::ActionView

  def base_query
    Concert.includes(:category)
  end

  def search_category
    query.where(category: options[:category])
  end

  def search_body_like
    query.merge(Concert.body_like(options[:body_like]))
  end

end
