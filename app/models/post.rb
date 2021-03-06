class Post < ActiveRecord::Base
  include VoteableGem
  include SluggableGem

  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  
  validates :title, :url, :description, presence: true
  validates :title, uniqueness: { case_sensitive: false }

  sluggable_column :title
end