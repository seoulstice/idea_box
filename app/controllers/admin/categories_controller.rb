class Admin::CategoriesController < Admin::BaseController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash.now[:success] = "Category Successfully Created"
      redirect_to admin_categories_path
    else
      flash[:failure] = "Category Not Created"
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to admin_categories_path
  end

  def index
    @categories = Category.all
  end

  private

    def category_params
      params.require(:category).permit(:classification)
    end

end
