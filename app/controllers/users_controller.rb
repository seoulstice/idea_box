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
    @ideas = @user.ideas
    @categories = Category.order(:classification)
    @idea_images = IdeaImage.all
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
