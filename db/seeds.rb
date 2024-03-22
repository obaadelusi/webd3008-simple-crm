# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Customer.destroy_all
AdminUser.destroy_all

# Seed customers table

query = URI.encode_www_form_component('person,face')

9.times do
  c_name = "#{Faker::Name.name}"
  c_phone = "#{Faker::PhoneNumber.phone_number}"
  c_email = "#{c_name.gsub(" ", "")}@#{Faker::Company.suffix}.ca"
  c_notes = "#{Faker::Quote.matz}"
  c_image = URI.open("https://source.unsplash.com/300x200/?#{query}")

  customer = Customer.create(fullname: c_name, phone: c_phone, notes: c_notes)

  addEmail = rand(2).floor
  addImage = rand(2).round

  if addEmail==1 && addImage==1
    customer.email = c_email
    customer.image.attach(io: c_image, filename: "m-#{customer.fullname.gsub(" ", "-")}.jpg")
    sleep(1)
  elsif addEmail==1
    customer.email = c_email
  elsif addImage==1
    customer.image.attach(io: c_image, filename: "m-#{customer.fullname.gsub(" ", "-")}.jpg")
    sleep(1)
  end

  customer.save
end

# Add default admin user
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
