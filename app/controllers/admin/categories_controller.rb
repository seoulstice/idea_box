class Admin::CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)

    redirect_to
  end

  def destroy

  end

  private

    def category_params
      params.require(:category).permit(:type)
    end

end
