class AddNationBuilderIdToBlogPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_posts, :nation_builder_id, :integer
  end
end
