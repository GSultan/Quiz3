class JoinsController < ApplicationController

before_action :authenticate_user, except: [:index, :show]


  def create
    idea = Idea.find(params[:idea_id])
    join = Join.new(user: current_user, idea: idea)
    if join.save
      redirect_to :back, notice: "Joined!"
    else
      redirect_to :back, alert:
      like.errors.full_messages.join(', ')
    end
  end

  def destroy
    Join.find(params[:id]).destroy
    redirect_to :back, notice: "unJoined!"
  end

end
