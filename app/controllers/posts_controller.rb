class PostsController < ApplicationController

  before_action :get_post, only: [:edit, :show, :update, :vote]
  before_action :require_user, except: [:index, :show, :vote]
  
  def index
    @posts = Post.all.sort_by{ |p| p.total_votes}.reverse
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
      flash[:notice] = "Your post has been added!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:notice] = "Your post has been updated!"
      redirect_to post_path(@post)
    else
      render :edit
    end  
  end

  def vote
    Vote.create(votable: @post, creator: current_user, vote: params[:vote] )
    flash[:notice] = "Your vote was counted."
    redirect_to :back
    
  end


  private

  def get_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :url, :description, :user_id, category_ids: [])
    
  end

end
