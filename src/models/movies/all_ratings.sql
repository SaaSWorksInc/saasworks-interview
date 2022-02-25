SELECT 
    *, 
    to_timestamp(timestamp)::date as rating_date 
FROM {{ source('movies', 'movie_ratings') }}