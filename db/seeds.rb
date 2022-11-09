# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
Flat.destroy_all

puts "Creating flats..."
27.times do
  flat = Flat.create!(
    name: "#{Faker::Adjective.negative.capitalize} #{Faker::Adjective.negative} #{Faker::Marketing.buzzwords}",
    address: Faker::Address.street_address,
    description: "#{Faker::Quote.famous_last_words}\n\n#{Faker::Quotes::Shakespeare.hamlet_quote}",
    price_per_night: rand(15..999),
    number_of_guests: rand(1..12),
    image_url: "https://source.unsplash.com/random/?interior"
  )
  puts "Flat #{flat.name} created"
end

puts "Finished!"
