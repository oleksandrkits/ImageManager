# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
100.times do
  usr = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      sex: rand(0..2),
      age: rand(1..120),
      about: Faker::Lorem.paragraph,
      password: '123456'
      )
  usr.save!
  Adress.create!(
      city: Faker::Address.city,
      street: Faker::Address.street_name,
      home_number: rand(5000),
      zip: '49000',
      user_id: usr.id
  )
end

usr = User.create(
    first_name: 'Oleksandr',
    last_name: 'Kitsera',
    email: 'sk@mail.com',
    sex: 0,
    age: 21,
    about: 'Programmer from Ukraine.',
    password: '123456',
    is_admin: true
)
usr.save!
Adress.create!(
    city: 'Lviv',
    street: 'Franka',
    home_number: 163,
    zip: '47000',
    user_id: usr.id
)

puts '100 users created'
