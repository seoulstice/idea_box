class ImagesController < ApplicationController

  def index
    @images = Image.order(:name).paginate(:page => params[:page])
  end
end
