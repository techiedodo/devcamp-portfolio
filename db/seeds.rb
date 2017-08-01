require 'faker'


10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: Faker::Lorem.paragraph(3)
  )
end
puts "10 blog posts create"

prct = Array(30..70)
5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: prct.sample
  )
end
puts "5 skills create"

9.times do |item|
  Portfolio.create!(
    title: "Portfolio title #{item}",
    subtitle: Faker::ChuckNorris.fact,
    body: Faker::Lorem.paragraph(3),
    main_image: "http://placehold.it/600x400",
    thumb_image: "http://placehold.it/350x150"
  )
end
puts "9 Portfolio items create"
