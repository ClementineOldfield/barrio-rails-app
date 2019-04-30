# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

if Category.count == 0
  Category.create( name: "Fruit, Vegetables & Produce" )
  Category.create( name: "Music & Entertainment" )
  Category.create( name: "Clothing" )
end

if User.count == 0
  (1..10).each do |i|
    User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      bio: Faker::Lorem.paragraphs(rand(1..3)),
      email: Faker::Internet.email,
      encrypted_password: "test"
    )
  end
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
  end
  
end

if Listing.find(1).image == nil
  (1..20).each do |i|
    Listing.find(i).image = Image.new(
      url: Faker::LoremPixel.image("50x60", false, 'food')
    )
  end
end