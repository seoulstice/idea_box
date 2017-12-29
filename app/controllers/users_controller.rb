class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Recipe Box, #{@user.name}!"
      redirect_to user_path(@user)
    else
      flash[:failure] = ""
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    @search = RecipeSearch.new(search_params)
    @recipes = @search.results.order(updated_at: :desc).paginate(:page => params[:page])
    @user = User.find(params[:id])
    @categories = Category.order(:classification)
    @ingredients = Ingredient.order(:body)
    @recipe_images = RecipeImage.all
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

  protected

    def search_params
      (params[:recipe_search] || {}).merge(user_id: current_user.id)
    end
end
