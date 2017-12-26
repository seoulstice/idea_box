class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Idea Box, #{@user.name}!"
      redirect_to user_path(@user)
    else
      flash[:failure] = ""
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @categories = Category.order(:classification)
    @idea_images = IdeaImage.all
    @search = IdeaSearch.new(search_params)
    @ideas = @search.results
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def search_params
    (params[:idea_search] || {}).merge(user_id: current_user.id)
    end

end
