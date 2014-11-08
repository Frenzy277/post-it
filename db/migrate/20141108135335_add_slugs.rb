class AddSlugs < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string
    add_index :users, :slug
    add_column :categories, :slug, :string
    add_index :categories, :slug
    add_index :posts, :slug
  end
end
