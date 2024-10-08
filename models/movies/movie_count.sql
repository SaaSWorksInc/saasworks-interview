SELECT
    COUNT(*) as num
FROM {{ ref('all_movies') }}
