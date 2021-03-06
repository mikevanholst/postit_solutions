class PostsController < ApplicationController

  before_action :get_post, only: [:edit, :show, :update, :vote]
  before_action :require_user, except: [:index, :show, :vote]
  
helper_method :user_votes, :post_votes,  :already_voted 

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
    if already_voted(@post)
       flash[:alert] = "You can only vote once per post" 
       # alert: "You can only vote once per post" 
     else
       Vote.create(votable: @post, creator: current_user, vote: params[:vote] )
      flash[":vote_for_#{@post.id}_notice"] = "Your vote was counted."
    end
    redirect_to :back
  end


  private

  def get_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :url, :description, :user_id, category_ids: [])
    
  end

  # def user_votes
  #   user_votes = []
  #   current_user.votes.each do |v|
  #     user_votes << v.id
  #   end
  #   return user_votes
  # end

  

end
