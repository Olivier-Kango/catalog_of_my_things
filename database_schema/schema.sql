/* Database schema to keep the structure of entire database. */
CREATE DATABASE catalog_of_my_things;

/* TABLES FOR BOOK AND LABEL */
CREATE TABLE book (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publisher VARCHAR(100) NOT NULL,
  cover_state VARCHAR(100) NOT NULL,
  publish_date  DATE
  archived Boolean,
  source_id INT REFERENCES source(id), 
  label_id INT REFERENCES label(id),
  genre_id INT REFERENCES genre(id),
  author_id INT REFERENCES author(id),
);

CREATE TABLE label (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(100) NOT NULL,
  color VARCHAR(100) NOT NULL,
);

/* TABLES FOR GENRE AND MUSIC_ALBUM */
CREATE TABLE music_album (
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  genre_id INT,
  author_id INT, 
  source_id INT,   
  label_id INT,
  CONSTRAINT fk_author
    FOREIGN KEY (author_id)
      REFERENCES  author(id),
  CONSTRAINT fk_source
    FOREIGN KEY (source_id)
      REFERENCES  source(id),
  CONSTRAINT fk_genres
    FOREIGN KEY (genres_id)
      REFERENCES genres(id),
  CONSTRAINT fk_label
    FOREIGN KEY (label_id)
      REFERENCES  label(id)
);

CREATE TABLE genres (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(150)
);

/* TABLES FOR GAMES AND AUTHORS */
CREATE TABLE games (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  published_date DATE,
  last_played_at DATE,
  archived BOOLEAN,
  multiplayer BOOLEAN, 
  genre_id INT REFERENCES genre (id),
  author_id INT REFERENCES authors (id), 
  label_id INT REFERENCES label (id),
  source_id INT REFERENCES source (id)
);

CREATE TABLE authors (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
);