class PostsController < ApplicationController
  before_action :get_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:index, :show]
  
  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      flash[:notice] = "Your post was created!"
      redirect_to post_url(@post)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Your post was updated!"
      redirect_to post_url(@post)
    else
      render :edit
    end
  end

  def vote
    vote = Vote.create(creator: current_user, vote: params[:vote], voteable: @post)

    #if vote 
    


    redirect_to :back
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def get_post
    @post = Post.find(params[:id])
  end


end
