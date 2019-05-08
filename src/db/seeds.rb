# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'geocoder'

if User.count == 0
  (1..10).each do |i|
    user = User.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      bio: Faker::Lorem.paragraphs(rand(1..3)),
      email: Faker::Internet.email,
      password: "test",
      password_confirmation: "test"
    )
    user.save!(validate: false)

    user.image.attach(io: File.open('app/assets/images/profiles/profile'+i.to_s+'.png'), filename: 'profile'+i.to_s+'.png', content_type: 'image/png')
    p "Created user #{i}"
    p user
  end
end

users = User.all

if Category.count == 0
  Category.create( name: "Fruit, Vegetables & Produce", icon: "carrot" )
  Category.create( name: "Music & Entertainment", icon: "theatre-masks" )
  Category.create( name: "Clothing", icon: "tshirt" )
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
    Listing.find(i).image.attach(io: File.open('app/assets/images/bread.jpeg'), filename: 'bread.jpeg', content_type: 'image/jpeg')
    p "Created Listing #{i}"
  end
end


if Address.count == 0
  users.each do |user|
    address = Address.create(
      street_1: Faker::Address.street_name,
      street_2: Faker::Address.secondary_address,
      suburb: Faker::Address.city,
      state: Faker::Address.state,
      postcode: Faker::Address.postcode,
      user: user
      # latitude: ((Geocoder.search(
      #   user.address[:street1], 
      #   user.address[:street2], 
      #   user.address[:suburb], 
      #   user.address[:state], 
      #   user.address[:postcode]
      # ).compact.join(', ')).first.coordinates)[0],
      # longitude: ((Geocoder.search(
      #   user.address[:street1], 
      #   user.address[:street2], 
      #   user.address[:suburb], 
      #   user.address[:state], 
      #   user.address[:postcode]
      # ).compact.join(', ')).first.coordinates)[1]
      )
 
     p "Created Address"
  end

end

# new_address = Address.new( street_1: Faker::Address.street_name, street_2: Faker::Address.secondary_address, suburb: Faker::Address.city, state: Faker::Address.state, postcode: Faker::Address.postcode, latitude: (Geocoder.search("#{[:street1, :street2, :suburb, :state, :postcode].compact.join(', ')}").first.coordinates)[0], longitude: (Geocoder.search("#{[:street1, :street2, :suburb, :state, :postcode].compact.join(', ')}").first.coordinates)[1])