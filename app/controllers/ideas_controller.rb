class IdeasController < ApplicationController

before_action :authenticate_user, except: [:index, :show]

  def index
    @ideas = Idea.order(created_at: :desc)


  end

  def show
    @idea = Idea.find(params[:id])
    # @comment = Comment.new

  end

  def new
    @idea = Idea.new

  end

  def create
    idea_params = params.require(:idea).permit([:title, :body, :user_id, :image])
    @idea = Idea.new idea_params
    @idea.user_id = session[:user_id]
    if @idea.save
      redirect_to idea_path(@idea), alert: 'Your idea has been saved!'
    else
      render :new
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to ideas_path, alert: 'Idea Deleted!'
  end

  def edit
    @idea = Idea.find(params[:id])

  end

  def update
    @idea = Idea.find(params[:id])
    idea_params = params.require(:idea).permit([:title, :body])
    if @idea.update idea_params
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end
end
