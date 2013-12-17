module ApplicationHelper

  def fix_url(str)
    str.starts_with?('http://') ? str : "http://#{str}"
  end

  def date_of(item)
    item.created_at.strftime("%b. %d")
  end
  
  def who_and_when(item)
    "Submitted by #{item.creator.username} on #{date_of(item)}"
 end

 def comment_just_submitted
  return false if !logged_in?
  Comment.last.user_id == current_user.id
 end

  def post_just_submitted
   return false if !logged_in?
    Post.last.user_id == current_user.id
   end

 def user_votes
    user_votes = []
    current_user.votes.each do |v|
      user_votes << v.id
    end
    return user_votes
  end


end