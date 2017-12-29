class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:new, :create, :edit]

  def create
    @recipe = @user.recipes.new(recipe_params)
    if @recipe.save
      @recipe.recipe_images.create(image_id: params[:recipe][:image_ids].to_i)
      flash[:success] = "Recipe successfully created."
      redirect_to user_path(current_user)
    else
      flash[:failure] = "Recipe not created."
      render :new
    end
  end

  def edit
    @categories = Category.order(:classification)
    @images = Image.order(:name)
  end

  def destroy
    @recipe.destroy

    redirect_to user_path(current_user)
  end

  def new
    @recipe = Recipe.new
    @categories = Category.order(:classification)
    @images = Image.order(:name)
  end

  def update
    @recipe.update(recipe_params)
    flash[:success] = "Recipe successfully edited."
    redirect_to user_path(current_user)
  end

  private

    def recipe_params
      params.require(:recipe).permit(:body, :category_id, {:image_ids => []})
    end

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end
end
