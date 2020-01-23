
  require('pg')

  require_relative('../db/sql_runner.rb')

  class Artist
    attr_reader :id, :artist_name, :year_active

  def initialize( options )
    @id = options['id'].to_i if options ['id']
    @artist_name = options['artist_name']
    @year_active = options['year_active'].to_i
  end

  def save()
    sql = "INSERT INTO artists
    (
      artist_name,
      year_active
      ) VALUES
      ($1, $2)
      RETURNING id"
      values = [@artist_name, @year_active]
      results = SqlRunner.run(sql, values)
      @id = results[0]["id"].to_i
    end

    def delete_all()
      sql = "DELETE FROM record_shop"
      SqlRunner.run(sql)
    end

    def self.all()
      sql="SELECT * FROM artists;"
      artists = SqlRunner.run(sql)
      return artists.map{|name|Artist.new(name)}
    end

    def self.find(id)
      sql "SELECT * FROM record_shop WHERE id = $1"
      values = [id]
      results = SqlRunner.run("find", values)
      artist_hash = results.first
      artist = Artist.new(artist_hash)
      return artist
    end

    def album()
      sql ="Select * From albums WHRE id = $1"
      values = [@artist_id]
      results = SqlRunner.run(sql, values)
      album_data = results.first
      album = Album.new(album_data)
      return album
    end



end
