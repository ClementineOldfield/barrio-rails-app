# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

if User.count == 0
  (1..10).each do |i|
    user = User.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      bio: Faker::Lorem.paragraphs(rand(1..3)),
      email: Faker::Internet.email,
      encrypted_password: "test"
    )
    user.save!(validate: false)
    p "Created user #{i}"
    p user
  end
end

if Category.count == 0
  Category.create( name: "Fruit, Vegetables & Produce" )
  Category.create( name: "Music & Entertainment" )
  Category.create( name: "Clothing" )
  p "Created Categories"
end

if Listing.count == 0
  (1..20).each do |i|
    Listing.create( 
      title: Faker::Commerce.product_name, 
      body: Faker::Lorem.paragraphs(rand(2..5)), 
      user_id: rand(1..5),
      price: 1000,
      category_id: rand(1..3),
      quantity: rand(3..10),
      is_available: true
    )
    p "Created Listing #{i}"
  end
end

tags = ['eggs', 'bread', 'community', 'school', 'animals']

if Listing.first.image == nil
  (1..20).each do |i|
    url = Faker::LoremFlickr.image("400x320", [tags[rand(0..4)], tags[rand(0..4)]])
    Listing.find(i).image = Image.new(
      url: url
    )
    p "Created image #{i}"
  end
end