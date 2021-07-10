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
