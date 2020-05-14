# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

WORK_FILE = Rails.root.join('db','works-seeds.csv',)

work_failures = []
CSV.foreach(WORK_FILE, :headers => true ) do |row|
  work = Work.new
  work.id = row['id']
  work.category = row['category']
  work.title = row['title']
  work.creator = row['creator']
  work.publication_year = row['publication_year']
  work.description = row['description']
  successful = work.save

  if !successful
    work_failures << work 
    puts "Failed to save work: #{work.inspect}"
  else   
    puts "Created work: #{work.inspect}"
  end 
  
end 

puts "Added #{Work.count} work records"
puts "#{work_failures.length} works failed to save"