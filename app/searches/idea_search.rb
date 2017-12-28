class IdeaSearch < Lupa::Search
  class Scope
    def category
      scope.where(category: search_attributes[:category])
    end

    def term
      scope.where(term: search_attributes[:term])
    end

  end
end
