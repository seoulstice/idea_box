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
    # @ideas = @user.ideas.order(updated_at: :desc)
    @ideas = Idea.all.paginate(page: params[:page], per_page: 10)
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
