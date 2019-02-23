namespace :db do
  desc 'This task imports blog posts from the linked NationBuilder account'
  task import_blog_posts: :environment do
    puts 'Importing blog posts...'
    num_imported = 0
    # Call blog posts index and paginate
    client = $nation_builder_client
    index = client.call(:blog_posts, :index, site_slug: 'sacramentodsa', id: 1)
    paginated = NationBuilder::Paginator.new(client, index)
    # Iterate over pages until none left
    loop do
      # Iterate over results on page and create blog posts that don't already exist
      paginated.body['results'].each do |post|
        # Skip if not published or already imported
        next if !post['published_at'] || BlogPost.find_by(nation_builder_id: post['id'])

        # Get full post content via show endpoint
        show = client.call(:blog_posts, :show, site_slug: 'sacramentodsa', blog_id: 1, blog_post_id: post['id'])
        full_post = show['blog_post']
        content = full_post['content_before_flip'] + full_post['content_after_flip']
        # Add to database
        puts "Importing post: \"#{post['title']}\""
        bp = BlogPost.create!(
          title: post['title'],
          content: content,
          posted_at: post['published_at'],
          slug: post['slug'],
          author_id: Admin.first.id,
          nation_builder_id: post['id']
        )
        num_imported += 1
        # Search for image in post
        doc = Nokogiri::HTML(content)
        img_tag = doc.xpath('//img')[0]
        bp.update!(featured_image: img_tag['src']) if img_tag
      end

      # Finish if no more pages are left
      break unless paginated.next?

      # Continue to next page
      paginated = paginated.next
    end

    puts "Imported #{num_imported} blog posts!"
  end
end
