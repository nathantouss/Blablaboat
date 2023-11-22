# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# 10.times do
#   user = User.create!(
#     email: Faker::Internet.email,
#     password: Devise::Encryptor.digest(User, Faker::Internet.password),
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name
#   )
#   puts user
# end
Trip.destroy_all
10.times do
  time_of_departure = Faker::Time.forward(days: 30, period: :morning)
  time_of_arrival = Faker::Time.forward(days: 40, period: :evening)

  # Assurer que la date d'arrivée est après la date de départ
  while time_of_arrival <= time_of_departure
    time_of_arrival = Faker::Time.forward(days: 40, period: :evening)
  end

  trip = Trip.create(
    origin: Faker::Address.city,
    destination: Faker::Address.city,
    time_of_departure: time_of_departure,
    time_of_arrival: time_of_arrival,
    number_of_people: rand(1..5),
    user: User.all.sample,
    price: rand(50..200)
  )
  puts trip
end
