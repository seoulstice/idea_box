class IdeasController < ApplicationController
  before_action :set_idea, only: [:edit, :update, :show, :destroy]

  def new
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new
  end

  def create
    @idea = Idea.create(idea_params)

    redirect_to user_path(@idea.user)
  end

  def edit

  end

  def update
    @idea.update(idea_params)

    redirect_to user_idea_path(idea.user, idea)
  end

  def destroy
    @idea.destroy

    redirect_to user_idea_path(@idea.user, @user)
  end
  private

    def idea_params
      params.require(:idea).permit(:body)
    end

    def set_idea
      @idea = Idea.find(params[:id])
    end
end
