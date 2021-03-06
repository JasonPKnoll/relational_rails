# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ARTISTS AND ARTWORKS
povi = Artist.create!(name: "Povi",
                      description: "From scratch avatar creator",
                      years_experience: 10,
                      comissions_open: false)

povichi = povi.artworks.create!(name: "Povichi",
                                art_type: "3D Base Model",
                                price: 32,
                                for_sale: true)

kemonomimi = povi.artworks.create!(name: "Kemonomimi",
                                  art_type: "3D Base Model",
                                  price: 45,
                                  for_sale: true)

srgrafo = Artist.create!(name: "SrGrafo",
                      description: "Digital artists",
                      years_experience: 5,
                      comissions_open: false)

chloe97 = srgrafo.artworks.create!(name: "Choloe #97 - Rawr",
                                  art_type: "Digital Art",
                                  price: 15,
                                  for_sale: false)

chloe97 = srgrafo.artworks.create!(name: "Choloe #125",
                                  art_type: "Digital Art",
                                  price: 15,
                                  for_sale: false)

# BREWERIES AND BEERS
@goldspot = Brewery.create!(name: "Goldspot Brewing Co", location: "Denver, CO", year_established: 2016, multiple_brewhouses: false)
@big_gay = @goldspot.beers.create!(name: "Big Gay IPA", style: "American IPA", abv: 5.0, ibu: 50, non_alcoholic: false)
@plum = @goldspot.beers.create!(name: "Plum on Eileen", style: "Plum Saison", abv: 5.8, ibu: 25, non_alcoholic: false)
@professional = @goldspot.beers.create!(name: "Professional Queers", style: "Hazy IPA", abv: 6.8, ibu: 65, non_alcoholic: false)

@diametric = Brewery.create!(name: "Diametric Brewing Co", location: "Lee's Summit, MO", year_established: 2017)
@ruby = @diametric.beers.create!(name: "Ruby on Rails", style: "Red Ale", abv: 5.3, ibu: 20, non_alcoholic: false)
@crimson = @diametric.beers.create!(name: "Crimson Bog", style: "Sour", abv: 6.8, ibu: 0, non_alcoholic: false)
@juan = @diametric.beers.create!(name: "Juan Moore", style: "Lager", abv: 5.5, ibu: 10, non_alcoholic: false)

@bells = Brewery.create!(name: "Bells Brewery", location: "Kalamazoo, MI", year_established: 1985, multiple_brewhouses: true)
@two_hearted = @bells.beers.create!(name: "Two Hearted Ale", style: "American IPA", abv: 7.0, ibu: 55, non_alcoholic: false)
@oberon = @bells.beers.create!(name: "Oberon Ale", style: "American Pale Wheat", abv: 5.8, ibu: 0, non_alcoholic: false)
@hopslam = @bells.beers.create!(name: "Hopslam Ale", style: "Double IPA", abv: 10.0, ibu: 65, non_alcoholic: false)

@sierra = Brewery.create!(name: "Sierra Nevada Brewing Co", location: "Chico, CA", year_established: 1980, multiple_brewhouses: true)
@narwal = @sierra.beers.create!(name: "Narwhal Imperial Stout", style: "Imperial Stout", abv: 10.2, ibu: 60, non_alcoholic: false)
@hazy = @sierra.beers.create!(name: "Hazy Little Thing", style: "New England IPA", abv: 6.7, ibu: 35, non_alcoholic: false)
@wild = @sierra.beers.create!(name: "Wild Little Thing", style: "Slightly Sour", abv: 5.5, ibu: 0, non_alcoholic: false)
@estate = @sierra.beers.create!(name: "Estate Ale", style: "Farmhouse Ale", abv: 6.1, ibu: 20, non_alcoholic: false)

@athletic = Brewery.create!(name: "Athletic Brewing Co", location: "Stratford, CT", year_established: 2018, multiple_brewhouses: false)
@run_wild = @athletic.beers.create!(name: "Run Wild IPA", style: "IPA", abv: 0.4, ibu: 35, non_alcoholic: true)
@upside_dawn = @athletic.beers.create!(name: "Upside Dawn Golden Ale", style: "Golden Ale", abv: 0.4, ibu: 15, non_alcoholic: true)
@all_out = @athletic.beers.create!(name: "All Out Stout", style: "Stout", abv: 0.3, ibu: 10, non_alcoholic: true)

@brooklyn = Brewery.create!(name: "Brooklyn Brewery", location: "Brooklyn, NY", year_established: 1987, multiple_brewhouses: false)
@special = @brooklyn.beers.create!(name: "Special Effects", style: "Hoppy Lager", abv: 0.4, ibu: 35, non_alcoholic: true)
@stonewall = @brooklyn.beers.create!(name: "The Stonewall Inn IPA", style: "Session IPA", abv: 4.0, ibu: 40, non_alcoholic: false)

@trillium = Brewery.create!(name: "Trillium Brewing Co", location: "Boston, MA", year_established: 2013, multiple_brewhouses: true)
@congress = @trillium.beers.create!(name: "Congress Street", style: "American IPA", abv: 7.4, ibu: 55, non_alcoholic: false)
@fort_point = @trillium.beers.create!(name: "Fort Point", style: "Pale Ale", abv: 6.6, ibu: 30, non_alcoholic: false)
@melcher = @trillium.beers.create!(name: "Melcher Street IPA", style: "American IPA", abv: 7.2, ibu: 45, non_alcoholic: false)

@new_glarus = Brewery.create!(name: "New Glarus Brewing", location: "New Glarus, WI", year_established: 1993, multiple_brewhouses: true)
@spotted_cow = @new_glarus.beers.create!(name: "Spotted Cow", style: "Farmhouse Ale", abv: 4.8, ibu: 18, non_alcoholic: false)
@two_women = @new_glarus.beers.create!(name: "Two Women", style: "Lager", abv: 5.0, ibu: 0, non_alcoholic: false)
@wisconsin = @new_glarus.beers.create!(name: "Wisconsin Belgian Red", style: "Fruit Beer", abv: 4.0, ibu: 0, non_alcoholic: false)
@serendipity = @new_glarus.beers.create!(name: "Serendipity", style: "Fruit Beer", abv: 4.0, ibu: 0, non_alcoholic: false)
