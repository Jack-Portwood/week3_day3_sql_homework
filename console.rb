
  require('pg')
  require("pry")
  require_relative("./models/artist.rb")
  require_relative("./models/album.rb")

  Artist.delete_all()
  Album.delete_all()

  artist1 = Artist.new({'artist_name' => 'Jack Duckworth', 'year_active' => '1941-2012'})
  artist1.save()

  artist2 = Artist.new({'artist_name' => 'Morrissesy', 'year_active' => '1977-2020'})
  artist2.save()

  album1 = Album.new({'album_title' => 'A Gift of Love', 'genre' => 'Easy-Listen', 'artist_id' => artist1.id})
  album1.save()

  album2 = Album.new({'album_title' => 'Time for love', 'genre' => 'Easy-Listen', 'artist_id' => artist1.id})
  album2.save()

  album3 = Album.new({'album_title' => 'Viva Hate', 'genre' => 'Jangle', 'artist_id' => artist2.id})
  album3.save()

  binding.pry
  nil
