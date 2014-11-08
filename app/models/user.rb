class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 2 }
  validates :password, presence: true, on: :create, length: { minimum: 3 }

  before_save :generate_slug

  def generate_slug
    self.slug = self.username.parameterize
  end

  def to_param
    self.slug
  end

end