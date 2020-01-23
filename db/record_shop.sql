    DROP TABLE IF EXISTS albums;
    DROP TABLE IF EXISTS artists;

    CREATE TABLE artists(
      id SERIAL PRIMARY KEY,
      artist_name VARCHAR(255),
      year_active INT
    );

    CREATE TABLE albums(
      id SERIAL PRIMARY KEY,
      album_title VARCHAR(225),
      genre VARCHAR(225),
      artist_id INT REFERENCES artists(id)
    );
