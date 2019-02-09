class DropHomes < ActiveRecord::Migration[5.1]
  def change
    content = "<div>Democratic Socialists of America (DSA) is the country's largest socialist organization, and Sacramento DSA is the fifth-largest chapter in the US. We are building progressive movements for social change in Oakland, Berkeley, and throughout the East Bay while establishing an openly democratic socialist presence in American communities and politics.<br><br></div><h1>Single-Payer Healthcare</h1><div>Sacramento DSA is organizing block-by-block to build a mass movement in California. See how we're working for <a href=\"https://www.sacdsa.org/campaigns-healthcare\">single-payer healthcare</a>.<br><br></div><h1>Annual Convention</h1><div>The <a href=\"http://convention.sacdsa.org/\">annual Sacramento DSA convention</a> is coming this April. Discover what you need to know about electing a new steering committee and collectively deciding on a priorities resolution that will guide our work in the upcoming year.<br><br></div><h1>Learn More</h1><div>Learn more <a href=\"https://www.sacdsa.org/about\">about Sacramento DSA</a>, who we are, and what we do.</div>"

    Page.create! title: 'We are the East Bay chapter of Democratic Socialists of America', content: content, slug: 'home'

    drop_table :homes
  end
end
