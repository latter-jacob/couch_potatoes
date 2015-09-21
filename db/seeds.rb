# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'


10.times do
  title = Faker::Book.title + rand(1..1000).to_s
  url = Faker::Internet.url
  Show.create!(title: title, url: url)
end
