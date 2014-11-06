class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 2 }
  validates :password, presence: true, length: { minimum: 3 }

end