class User < ActiveRecord::Base;
  has_many :votes
  has_many :posts
  has_many :comments
  has_secure_password validations: false
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 4}

end