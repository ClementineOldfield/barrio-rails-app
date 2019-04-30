# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

if Listing.count == 0
  (1..20).each do |i|
    Listing.create( title: Faker::Commerce.product_name, body: Faker::Lorem.paragraphs(rand(2..5)) )
  end
end