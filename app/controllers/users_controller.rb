class UsersController < ApplicationController

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

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @ideas = IdeaSearch.new(current_user.ideas).search(search_params)
    @categories = Category.order(:classification)
    @idea_images = IdeaImage.all
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  protected

    def search_params
      params.permit(:category, :term, created_between: [:start_date, :end_date])
    end
end
