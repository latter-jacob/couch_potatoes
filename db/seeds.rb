# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "faker"
require "factory_girl"

Program.create(title: Faker::Book.title, url: "Kk8eJh4i8Lo")
Program.create(title: Faker::Book.title, url: "tG35R8F2j8k")
Program.create(title: Faker::Book.title, url: "0OkB6p_FZAw")
Program.create(title: Faker::Book.title, url: "c-tW0CkvdDI")
Program.create(title: Faker::Book.title, url: "tEddixS-UoU")
Program.create(title: Faker::Book.title, url: "2vjPBrBU-TM")
Program.create(title: Faker::Book.title, url: "QcIy9NiNbmo")
Program.create(title: Faker::Book.title, url: "ftrwe16sBiA")
Program.create(title: Faker::Book.title, url: "qL1B_r9nC9k")
Program.create(title: Faker::Book.title, url: "rYEDA3JcQqw")
Program.create(title: Faker::Book.title, url: "49vGlSyf05A")
Program.create(title: Faker::Book.title, url: "iWOyfLBYtuU")
Program.create(title: Faker::Book.title, url: "KWZGAExj-es")
Program.create(title: "Friends", url: "Niu9Zmrx0p8")

# next step: add seed comments and users
# add new review button
# investigate getting button to expand form


User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")

19.times do |n|
  review = Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: n + 1)
  Vote.create(review: review, user_id: n + 1, value: 0)
end

# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 2)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 3)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 4)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 5)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 6)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 7)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 8)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 9)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 10)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 11)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 12)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 13)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 14)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 15)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 16)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 17)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 18)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 19)
