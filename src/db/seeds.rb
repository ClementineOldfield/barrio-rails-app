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

bios = [
  "We want you to have choice, which is why we produce free range organic eggs. No matter which eggs you choose, they all come with the promise of quality and freshness. Buy our local eggs today.",
  "A musician is a person who plays a musical instrument or is musically talented.[1] Anyone who composes, conducts, or performs music is referred to as a musician.[2] A musician who plays a musical instrument is also known as an instrumentalist.",
  "Once a commercial nursery, ‘Gowan Ross’ is now a beautiful residence with farming potential nestled in 40 acres of bushland, paddocks and gardens in  Mount Wilson, just under 2 hours from Sydney. Mt Wilson is a heritage garden village in the World Heritage Blue Mountains. The area has magnificent natural bushland and rainforest, walks and canyons as well as historic houses and grand exotic gardens.",
  "Community gardens are places where people grow food, create habitat and connect with nature and their local community. Inner West Council encourages you to get involved with an existing community garden. Council can also support you to establish a new community garden.",
  "To deliver excellence to our Members and guests by providing the very best facilities within a secure, quality environment supporting the needs of our Community, Rugby League and other sports. Here at Wests Ashfield Leagues Club we take pride in our ability to create a comfortable and exciting environment for you, your friends, and your family. No matter the time or the day here at Wests Ashfield our staff are committed to creating a fantastic and full experience catering for all your needs.",
  "We want you to have choice, which is why we produce free range organic eggs. No matter which eggs you choose, they all come with the promise of quality and freshness. Buy our local eggs today.",
  "A musician is a person who plays a musical instrument or is musically talented.[1] Anyone who composes, conducts, or performs music is referred to as a musician.[2] A musician who plays a musical instrument is also known as an instrumentalist.",
  "Once a commercial nursery, ‘Gowan Ross’ is now a beautiful residence with farming potential nestled in 40 acres of bushland, paddocks and gardens in  Mount Wilson, just under 2 hours from Sydney. Mt Wilson is a heritage garden village in the World Heritage Blue Mountains. The area has magnificent natural bushland and rainforest, walks and canyons as well as historic houses and grand exotic gardens.",
  "To deliver excellence to our Members and guests by providing the very best facilities within a secure, quality environment supporting the needs of our Community, Rugby League and other sports. Here at Wests Ashfield Leagues Club we take pride in our ability to create a comfortable and exciting environment for you, your friends, and your family. No matter the time or the day here at Wests Ashfield our staff are committed to creating a fantastic and full experience catering for all your needs.",
  "We want you to have choice, which is why we produce free range organic eggs. No matter which eggs you choose, they all come with the promise of quality and freshness. Buy our local eggs today.",
]

users.each_with_index do |user, i|
  user.update(
    bio: bios[i]
  )
end

test_user = User.new(
  first_name: "Jane",
  last_name: "Lane",
  bio: bios[rand(0..9)],
  email: "test@email.com",
  password: "123456",
  password_confirmation: "123456"
)
test_user.save!(validate: false)

test_user.image.attach(io: File.open('app/assets/images/profiles/profile1.png'), filename: 'profile1.png', content_type: 'image/png')
p "Created test user"
p test_user

if Category.count == 0
  Category.create( name: "Fruit, Vegetables & Produce", icon: "carrot" )
  Category.create( name: "Music & Entertainment", icon: "theatre-masks" )
  Category.create( name: "Clothing", icon: "tshirt" )
  p "Created Categories"
end

bios = [
  "We want you to have choice, which is why we produce free range organic eggs. No matter which eggs you choose, they all come with the promise of quality and freshness. Buy our local eggs today.",
  "A musician is a person who plays a musical instrument or is musically talented.[1] Anyone who composes, conducts, or performs music is referred to as a musician.[2] A musician who plays a musical instrument is also known as an instrumentalist.",
  "Once a commercial nursery, ‘Gowan Ross’ is now a beautiful residence with farming potential nestled in 40 acres of bushland, paddocks and gardens in  Mount Wilson, just under 2 hours from Sydney. Mt Wilson is a heritage garden village in the World Heritage Blue Mountains. The area has magnificent natural bushland and rainforest, walks and canyons as well as historic houses and grand exotic gardens.",
  "Community gardens are places where people grow food, create habitat and connect with nature and their local community. Inner West Council encourages you to get involved with an existing community garden. Council can also support you to establish a new community garden.",
  "To deliver excellence to our Members and guests by providing the very best facilities within a secure, quality environment supporting the needs of our Community, Rugby League and other sports. Here at Wests Ashfield Leagues Club we take pride in our ability to create a comfortable and exciting environment for you, your friends, and your family. No matter the time or the day here at Wests Ashfield our staff are committed to creating a fantastic and full experience catering for all your needs.",
  "We want you to have choice, which is why we produce free range organic eggs. No matter which eggs you choose, they all come with the promise of quality and freshness. Buy our local eggs today.",
  "A musician is a person who plays a musical instrument or is musically talented.[1] Anyone who composes, conducts, or performs music is referred to as a musician.[2] A musician who plays a musical instrument is also known as an instrumentalist.",
  "Once a commercial nursery, ‘Gowan Ross’ is now a beautiful residence with farming potential nestled in 40 acres of bushland, paddocks and gardens in  Mount Wilson, just under 2 hours from Sydney. Mt Wilson is a heritage garden village in the World Heritage Blue Mountains. The area has magnificent natural bushland and rainforest, walks and canyons as well as historic houses and grand exotic gardens.",
  "To deliver excellence to our Members and guests by providing the very best facilities within a secure, quality environment supporting the needs of our Community, Rugby League and other sports. Here at Wests Ashfield Leagues Club we take pride in our ability to create a comfortable and exciting environment for you, your friends, and your family. No matter the time or the day here at Wests Ashfield our staff are committed to creating a fantastic and full experience catering for all your needs.",
  "We want you to have choice, which is why we produce free range organic eggs. No matter which eggs you choose, they all come with the promise of quality and freshness. Buy our local eggs today.",
]

if Listing.count == 0
  (1..20).each do |i|
    Listing.create( 
      title: Faker::Commerce.product_name, 
      body: bios[rand(0..9)], 
      user_id: rand(1..5),
      price: 1000,
      category_id: rand(1..3),
      quantity: rand(3..10),
      active: true
    )
    Listing.find(i).image.attach(io: File.open('app/assets/images/bread.jpeg'), filename: 'bread.jpeg', content_type: 'image/jpeg')
    p "Created Listing #{i}"
  end
end

test_listing = test_user.listings.new(
  title: "My Test Listing",
  body: "Lorem ipsum",
  user_id: 11,
  price: 2000,
  category_id: 2,
  quantity: 3,
  active: true
)
test_listing.save!
p "Created test listing"
test_listing.image.attach(io: File.open('app/assets/images/bread.jpeg'), filename: 'bread.jpeg', content_type: 'image/jpeg')
p test_listing

states = ["QLD", "NSW", "VIC", "ACT", "TAS", "SA", "WA", "NT"]

if Address.count == 0
  users.each do |user|
    address = Address.create(
      street_1: Faker::Address.street_name,
      street_2: Faker::Address.secondary_address,
      suburb: Faker::Address.city,
      state: states[rand(0...states.length)],
      postcode: Faker::Address.postcode,
      user: user
    )
 
    p "Created Address"
  end
end

if Conversation.count == 0
  users.each do |user|
    (1..10).each do |i|
      unless i == user.id 
        conversation = Conversation.new(
          sender_id: user.id,
          recipient_id: i
        ) 
        conversation.save!
        p "created conversation #{i}"
      end
    end
  end
end

conversations = Conversation.all

messages = [
  "Hey, how's it going?",
  "I'm interested in buying your listing.",
  "Good thanks.",
  "Thanks for the prompt delivery",
  "Is it possible to organise a subscription?"
]

if Message.count == 0
  conversations.each do |conversation|
    (1..5).each do |i|
      message = Message.new(
        conversation_id: conversation.id,
        body: messages[rand(0..4)],
        read: false
      )
      if i % 2 == 0
        message.update(
          user_id: conversation.sender.id
        )
      else
        message.update(
          user_id: conversation.recipient.id
        )
      end
      p "created message"
      p message
    end
  end
end