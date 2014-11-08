class CommentsController < ApplicationController
  before_action :require_user
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator = current_user

    if @comment.save
      flash[:notice] = "Successfully added a comment!"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def vote
    @comment = Comment.find(params[:id])
    vote = Vote.create(vote: params[:vote], creator: current_user, voteable: @comment)

    if vote.valid?    
      flash[:notice] = "Your vote was counted."
    else
      @error = true
      flash[:error] = "You can only vote once on this comment."
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end