CREATE SCHEMA IF NOT EXISTS sources;
CREATE SCHEMA IF NOT EXISTS transforms;

DROP TABLE IF EXISTS sources.movie_metadata;
DROP TABLE IF EXISTS sources.movie_ratings;

CREATE TABLE sources.movie_metadata (
    budget numeric,
    genres text,
    homepage text,
    id integer,
    imdb_id text,
    original_language text,
    original_title text,
    overview text,
    popularity numeric,
    poster_path text,
    release_date date,
    revenue numeric,
    runtime numeric,
    status text,
    tagline text,
    title text,
    video text
);

CREATE TABLE sources.movie_ratings (
    user_id integer,
    movie_id integer,
    rating numeric,
    timestamp integer
);

\COPY sources.movie_ratings FROM PROGRAM 'gzcat movie-data/ratings.csv' CSV HEADER;
\COPY sources.movie_metadata FROM PROGRAM 'gzcat movie-data/movies_metadata.csv' CSV HEADER;
