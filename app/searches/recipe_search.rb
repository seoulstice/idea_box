require "searchlight/adapters/action_view"

class RecipeSearch < Searchlight::Search
  include Searchlight::Adapters::ActionView

  def base_query
    Recipe.includes(:category, :recipe_images, :ingredients)
  end

  def search_category
    query.where(category: options[:category])
  end

  def search_ingredient_ids
    query.where(ingredient_ids: options[:ingredient_ids])
    # binding.pry
  end

  def search_body_like
    query.merge(Recipe.body_like(options[:body_like]))
  end

end
