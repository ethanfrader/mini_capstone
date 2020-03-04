# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
beer = Product.create([{ name: "IPA" }, { price: 6 }, { description: "Extra hoppy and bitter with a fruity finish" }, { ounces: 12 }, { abv: "7.0%" }])
beer.save
beer = Product.create([{ name: "Brown Ale" }, { price: 8 }, { description: "Dark and malty; hints of chocolate and cinnamon" }, { ounces: 12 }, { abv: "9.0%" }])
beer.save
beer = Product.create([{ name: "Hefeweizen" }, { price: 5 }, { description: "Hazy and creamy; subtle notes of orange" }, { ounces: 12 }, { abv: "5.0%" }])
beer.save
