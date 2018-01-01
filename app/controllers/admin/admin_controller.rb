class Admin::AdminController < Admin::BaseController

  def dashboard
    @genres = Genre.order(:classification).paginate(:page => params[:page])
    @images = Image.order(:name).paginate(:page => params[:page])
  end

end
