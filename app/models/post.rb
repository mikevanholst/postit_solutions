class Post < ActiveRecord::Base; 
belongs_to :creator, foreign_key: 'user_id', class_name: 'User'  
has_many :comments
has_many :post_categories
has_many :categories, through: :post_categories
has_many :votes, as: :votable



validates :title, presence: true, length: {minimum: 5}
validates :url, presence: true,  uniqueness: true

validates_presence_of :description, message: "please add a description"
# validates :user_id, presence: true


  def up_votes
    self.votes.where(vote: true).size
  end


  def down_votes
    self.votes.where(vote: false).size
  end

  def total_votes
    self.up_votes - self.down_votes
  end

end