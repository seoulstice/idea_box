class Admin::ImagesController < Admin::BaseController

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      #flash[:success] message goes here
      redirect_to admin_dashboard_path
     else

    end
  end

  private

    def image_params
      params.require(:image).permit(:url)
    end
end
