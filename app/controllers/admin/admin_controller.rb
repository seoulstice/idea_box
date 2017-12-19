class Admin::AdminController < Admin::BaseController

  def dashboard
    @categories = Category.all
    @images = 
  end

end
