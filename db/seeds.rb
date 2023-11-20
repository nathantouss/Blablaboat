# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



# Créer 10 utilisateurs
User.delete_all
Trip.delete_all

10.times do
  User.create(
    email: Faker::Internet.email,
    encrypted_password: Devise::Encryptor.digest(User, Faker::Internet.password),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

# Créer 10 voyages associés à des utilisateurs
10.times do
  Trip.create(
    origin: Faker::Address.city,
    destination: Faker::Address.city,
    time_of_departure: Faker::Time.forward(days: 30, period: :morning),
    time_of_arrival: Faker::Time.forward(days: 40, period: :evening),
    number_of_people: rand(1..5),
    user: User.all.sample
  )
end
