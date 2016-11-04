# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
# CheerUp.destroy_all

10.times do
  User.create(last_name: Faker::Name.name, first_name: Faker::Name.name, username: Faker::Beer.malts, password: Faker::Beer.malts, email: Faker::Internet.email)
end

10.times do
  CheerUp.create(title: Faker::Hipster.sentence(1), content: Faker::Hipster.sentence(7), category: Faker::Beer.malts, user_id: Random.new.rand(10))
end
