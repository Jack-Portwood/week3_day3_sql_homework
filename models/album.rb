
  require('pg')

  class Album
    attr_accessor :album_title, :genre
    attr_reader :id, :artist_id

    def initialize(options)
      @album_title = options['album_title']
      @genre = options['genre']
      @id = options['id'].to_i if options['id']
      @artist_id = options['artist_id'].to_i
    end

  def save()
    sql = "INSERT INTO albums
    (
      album_title,
      genre,
      artist_id
      ) VALUES
      ($1, $2, $3)
      RETURNING id"
      values = [@album_title, @genre, @artist_id]
      results = SqlRunner.run(sql, values)
      @id = results[0]["id"].to_i
    end

    def delete_all()
      sql = "DELETE FROM record_shop"
      SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM albums;"
      albums = SqlRunner.run(sql)
      return albums.map{|title|Album.new(title)}
    end

    def self.find(id)
      sql "SELECT * FROM record_shop WHERE id = $1"
      values = [id]
      results = SqlRunner.run("find", values)
      album_hash = results.first
      album = Album.new(album_hash)
      return album
    end

    def artist()
      sql ="Select * From artists WHERE id = $1"
      values = [@artist_id]
      results = SqlRunner.run(sql, values)
      artist_data = results.first
      artist = Artist.new(artist_data)
      return artist
    end







end
