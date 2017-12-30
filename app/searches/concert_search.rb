require "searchlight/adapters/action_view"

class ConcertSearch < Searchlight::Search
  include Searchlight::Adapters::ActionView

  def base_query
    @user = User.find(options[:user_id])
    @user.concerts.includes(:category)
    # binding.pry
  end

  def search_category
    query.where(category: options[:category])
  end

  def search_name_like
    query.merge(Concert.name_like(options[:name_like]))
  end

  def search_purchased
    query.where(purchased: checked?(options[:purchased]))
  end



end
