class CommentsController < ApplicationController


  before_action :require_user
  helper_method :user_votes, :comment_votes,  :already_voted 
  
  def create
    @post = Post.find(params[:post_id])
 
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator = current_user

    if @comment.save
      flash[:notice] = "Thank you for your comment."
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def vote
    @comment = Comment.find(params[:id])
    if 
      already_voted(@comment)
       flash[:alert] = "You can only vote once per comment" 
    else
      Vote.create(votable: @comment, creator: current_user, vote: params[:vote] )
      flash[":vote_for_#{@comment.id}_notice"] = "Your vote was counted."
    end
    redirect_to :back
  end

def user_votes
    user_votes = []
    current_user.votes.each do |v|
      user_votes << v.id
    end
    return user_votes
  end

  def  comment_votes(comment)
    comment_votes = []
    comment.votes.each do |v|
     comment_votes << v.id
    end
    return comment_votes
  end

  def already_voted(comment)
   (user_votes & comment_votes(comment)).present?
    
  end


end
