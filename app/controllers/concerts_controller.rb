class ConcertsController < ApplicationController
  before_action :set_concert, only: [:edit, :update, :destroy, :show]
  before_action :set_user, only: [:new, :create, :edit, :update]

  def new
    @concert = Concert.new
    @genres = Genre.order(:classification)
    @images = Image.order(:name)
  end

  def create
    @genres = Genre.order(:classification)
    @images = Image.order(:name)
    @concert = @user.concerts.new(concert_params)
    if @concert.save!
      @concert.concert_images.create(image_id: params[:concert][:image_ids].to_i)
      flash[:success] = "Concert successfully created."
      redirect_to user_path(current_user)
    else
      flash[:failure] = "Concert not created."
      render :new
    end
  end

  def edit
    @genres = Genre.order(:classification)
    @images = Image.order(:name)
  end

  def update
    concert = @concert
    concert.update(concert_params)
    @concert.concert_images.update(image_id: params[:concert][:image_ids].to_i)
    flash[:success] = "Concert successfully edited."
    redirect_to user_path(current_user)
  end

  def show

  end

  def destroy
    @concert.destroy

    redirect_to user_path(current_user)
  end

  private

    def concert_params
      params.require(:concert).permit(:name, :purchased, :date, :genre_id, {:image_ids => []})
    end

    def set_concert
      @concert = Concert.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end
end
