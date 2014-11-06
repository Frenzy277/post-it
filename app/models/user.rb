class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  has_secure_password

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 2 }

end