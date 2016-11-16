class CommentsController < ApplicationController

  before_action :authenticate_user, except: [:index, :show]


  def create
    # GIVEN, WHEN, THEN

    @idea = Idea.find(params[:idea_id])
    comment_params = params.require(:comment).permit([:body])
    @comment = Comment.new(comment_params)
    @comment.idea = @idea
    @comment.user = current_user

    if @comment.save
      redirect_to idea_path(@idea), notice: 'Comment Saved!'
    else

      @comment.errors.full_messages.join(', ')
    end

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to idea_path(@comment.idea), notice: 'Comment Deleted!'
  end
end
