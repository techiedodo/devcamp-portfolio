require 'faker'

5.times do |topic|
  Topic.create!(
    title: Faker::Beer.name
  )
end

puts "5 Topics created"

topics = Topic.all

30.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: Faker::Lorem.paragraph(3),
    topic_id: topics.ids.sample
  )
end
puts "#{Blog.count} blog posts total"

prct = Array(30..70)
5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: prct.sample,
    badge: Placeholder.image_generator(height: '250', width: '250')
  )
end
puts "#{Skill.count} skills total"

15.times do |item|
  Portfolio.create!(
    title: "Portfolio title #{item}",
    subtitle: Faker::ChuckNorris.fact,
    body: Faker::Lorem.paragraph(3),
    main_image: "http://placehold.it/600x400",
    thumb_image: "http://placehold.it/350x150"
  )
end
4.times do |item|
  Portfolio.create!(
    title: "Portfolio title #{item}",
    subtitle: "scope",
    body: Faker::Lorem.paragraph(3),
    main_image: "http://placehold.it/600x400",
    thumb_image: "http://placehold.it/350x150"
  )
end
4.times do |item|
  Portfolio.create!(
    title: "Portfolio title #{item}",
    subtitle: "other",
    body: Faker::Lorem.paragraph(3),
    main_image: "http://placehold.it/600x400",
    thumb_image: "http://placehold.it/350x150"
  )
end
puts "#{Portfolio.count} Portfolio items total"
portfolios = Portfolio.all
5.times do |tech|
  Technology.create!(
  name: "Technology #{tech}",
  portfolio_id: portfolios.ids.sample
  )
end
puts "3 technologies created"
