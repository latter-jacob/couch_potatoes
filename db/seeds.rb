# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

CSV.foreach('data.csv', headers: true, header_converters: :symbol) do |row|
  genre = Genre.find_or_create_by(name: row[:genre])
  Program.create(title: row[:title],
                 url: row[:url],
                 start_year: row[:start_year],
                 end_year: row[:end_year],
                 genre: genre)
end
