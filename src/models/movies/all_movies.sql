SELECT
    * 
FROM {{ source('movies', 'movie_metadata') }}