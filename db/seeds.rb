# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@goldspot = Brewery.create!(name: "Goldspot Brewing Co", location: "Denver, CO", year_established: 2016, multiple_brewhouses: false)
@big_gay = @goldspot.beers.create!(name: "Big Gay IPA", style:   "American IPA", abv: 5.0, ibu: 50, non_alcoholic: false)


@bells = Brewery.create!(name: "Bells Brewery", location: "Kalamazoo, MI", year_established: 1985, multiple_brewhouses: true)
@two_hearted = @bells.beers.create!(name: "Two Hearted Ale", style: "American IPA", abv: 7.0, ibu: 55, non_alcoholic: false)
@oberon = @bells.beers.create!(name: "Oberon Ale", style: "American Pale Wheat", abv: 5.8, ibu: 0, non_alcoholic: false)


@sierra = Brewery.create!(name: "Sierra Nevada Brewing Co", location: "Chico, CA", year_established: 1980, multiple_brewhouses: true)
@narwal = @sierra.beers.create!(name: "Narwhal Imperial Stout", style: "Imperial Stout", abv: 10.2, ibu: 60, non_alcoholic: false)
