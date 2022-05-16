# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require_relative '../lib/populator_fix.rb' 

#Populating Menus table
10.times do
    Menu.create(
        name: Faker::Food.dish,
        price: Faker::Number.between(from: 100, to: 500)
    )
end