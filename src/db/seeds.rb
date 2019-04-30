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

users = User.all
profiles = [
  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
  'https://images.pexels.com/photos/678783/pexels-photo-678783.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
  'https://images.pexels.com/photos/1687675/pexels-photo-1687675.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
  'https://images.pexels.com/photos/428361/pexels-photo-428361.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
  'https://images.pexels.com/photos/952005/pexels-photo-952005.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
  'https://images.pexels.com/photos/633432/pexels-photo-633432.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
  'https://images.pexels.com/photos/2078467/pexels-photo-2078467.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
  'https://images.pexels.com/photos/1031081/pexels-photo-1031081.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
  'https://images.pexels.com/photos/889511/pexels-photo-889511.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
  'https://images.pexels.com/photos/64385/pexels-photo-64385.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'
]

if User.first.image == nil
  users.each_with_index do |user, i|
    user.image = Image.new(
      url: profiles[i]
    )
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

images = [
  'https://images.pexels.com/photos/1033716/pexels-photo-1033716.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/841297/pexels-photo-841297.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/1042402/pexels-photo-1042402.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/428301/pexels-photo-428301.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
  'https://images.pexels.com/photos/264537/pexels-photo-264537.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/8148/kitchen-cookies-work-cake-8148.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/461060/pexels-photo-461060.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
  'https://images.pexels.com/photos/1453006/pexels-photo-1453006.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
  'https://images.pexels.com/photos/325521/pexels-photo-325521.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/7096/people-woman-coffee-meeting.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/207896/pexels-photo-207896.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'
]

if Listing.first.image == nil
  (1..20).each do |i|
    random = rand(0...images.length)
    url = images[random]
    Listing.find(i).image = Image.new(
      url: url
    )
    p "Created image #{i}, Random = #{random}, url = #{url}"
  end
end