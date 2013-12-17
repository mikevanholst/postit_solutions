class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # @current_user = "Ithyca"
  end

  def logged_in?  
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to do that!"
      redirect_to root_path
    end
  end


def user_votes
    user_votes = []
    current_user.votes.each do |v|
      user_votes << v.id
    end
    return user_votes
  end


  def  post_votes(post)
    post_votes = []
    post.votes.each do |v|
     post_votes << v.id
    end
    return post_votes
  end

  def already_voted(post)
   (user_votes & post_votes(post)).present?
  end
end

