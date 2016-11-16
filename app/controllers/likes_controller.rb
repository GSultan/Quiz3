class LikesController < ApplicationController

  before_action :authenticate_user, except: [:index, :show]


  def create
    idea = Idea.find(params[:idea_id])
    like = Like.new(user: current_user, idea: idea)
    if like.save
      redirect_to :back, notice: "Liked!"
    else
      redirect_to :back, alert:
      like.errors.full_messages.join(', ')
    end
  end

  def destroy
    Like.find(params[:id]).destroy
    redirect_to :back, notice: "Unliked"
  end
end
