class Post < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable

  validates :title, :url, :description, presence: true
  validates :title, uniqueness: { case_sensitive: false }

  def total_votes
    up_vote - down_vote
  end

  def up_vote
    self.votes.where(vote: true).size
  end

  def down_vote
    self.votes.where(vote: false).size
  end

end