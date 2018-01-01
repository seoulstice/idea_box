class Admin::AdminController < Admin::BaseController

  def dashboard
    @genres = Genre.order(:classification).paginate(:page => params[:genres_page])
    @images = Image.order(:name).paginate(:page => params[:images_page])
  end

end
