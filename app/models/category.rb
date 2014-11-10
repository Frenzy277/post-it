class Category < ActiveRecord::Base
  include SluggableGem

  has_many :post_categories, dependent: :destroy
  has_many :posts, through: :post_categories

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  sluggable_column :name
end