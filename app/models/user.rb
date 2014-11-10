class User < ActiveRecord::Base
  include SluggableGem

  has_many :posts
  has_many :comments

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, on: :create, length: { minimum: 3 }

  sluggable_column :username
end