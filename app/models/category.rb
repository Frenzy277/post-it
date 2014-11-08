class Category < ActiveRecord::Base
  has_many :post_categories, dependent: :destroy
  has_many :posts, through: :post_categories

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  before_save :generate_slug

  def generate_slug
    self.slug = self.name.parameterize
  end

  def to_param
    self.slug
  end
end