class Admin::GenresController < Admin::BaseController

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash.now[:success] = "Genre Successfully Created"
      redirect_to admin_dashboard_path
    else
      flash[:failure] = "Genre Not Created"
      render :new
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy

    redirect_to admin_dashboard_path
  end

  def index
    @genres = Genre.all
  end

  private

    def genre_params
      params.require(:genre).permit(:classification)
    end

end
