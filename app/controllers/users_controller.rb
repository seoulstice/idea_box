class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Concert Box, #{@user.name}!"
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
    @search = ConcertSearch.new(search_params)
    @concerts = @search.results.paginate(:page => params[:page])
    @user = User.find(params[:id])
    @genres = Genre.order(:classification)
    @concert_images = ConcertImage.all
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

  protected
    def search_params
      (params[:concert_search] || {}).merge(user_id: current_user.id)
    end

end
