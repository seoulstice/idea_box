class Admin::AdminController < Admin::BaseController

  def dashboard
    @genres = Genre.all
    @images = Image.all
  end

end
