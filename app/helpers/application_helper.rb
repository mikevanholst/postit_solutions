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

 # def who_and_when(item)
 #    "Submitted by #{content_tag(<%= "test" %>) on #{date_of(item)}"
 # end
end