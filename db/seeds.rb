require "csv"

CSV.foreach('data.csv', headers: true, header_converters: :symbol) do |row|
  genre = Genre.find_or_create_by(name: row[:genre])
  Program.find_or_create_by(title: row[:title],
                 url: row[:url],
                 start_year: row[:start_year],
                 end_year: row[:end_year],
                 genre: genre)
end
