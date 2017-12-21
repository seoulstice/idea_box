class IdeasController < ApplicationController
  before_action :set_idea, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:new, :create, :edit]

  def new
    @idea = Idea.new
    @categories = Category.order(:classification)
  end

  def create
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      flash.now[:success] = "Idea Successfully Created"
      redirect_to user_path(current_user)
    else
      flash[:failure] = "Idea Not Created"
      render :new
    end
  end

  def edit

  end

  def update
    @idea.update(idea_params)
    redirect_to user_ideas_path(current_user)
  end

  def destroy
    @idea.destroy

    redirect_to user_path(current_user)
  end

  private

    def idea_params
      params.require(:idea).permit(:body, :category_id, :image_ids =>[])

    end

    def set_idea
      @idea = Idea.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end
end
