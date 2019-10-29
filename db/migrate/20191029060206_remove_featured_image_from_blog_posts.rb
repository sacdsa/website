class RemoveFeaturedImageFromBlogPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :blog_posts, :featured_image, :string
  end
end
