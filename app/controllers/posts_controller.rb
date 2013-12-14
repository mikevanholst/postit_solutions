class PostsController < ApplicationController

  before_action :get_post, only: [:edit, :show, :update]
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

  private

  def get_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :url, :description, :user_id, category_ids: [])
    
  end

end
