class CommentsController < ApplicationController
  def create
    #binding.pry
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator = User.first

    if @comment.save
      flash[:notice] = "Successfully added a comment!"
      redirect_to posts_path
    else
      render 'posts/show'
    end
  end
end