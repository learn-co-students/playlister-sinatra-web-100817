# Add seed data here. Seed your database with `rake db:seed`

artist = Artist.create(name: "Person with a Face")
genre1 = Genre.create(name: "Hippity Hop")
genre2 = Genre.create(name: "New Age Garbage")
song = Song.create(name: "That One with the Guitar")

song.artist = artist
song.genres << genre2
song.save