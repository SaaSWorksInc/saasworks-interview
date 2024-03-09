# DBT Exercise

## Prerequisites

- Poetry (https://python-poetry.org/docs/#installation)
- DBT Knowledge (https://docs.getdbt.com/dbt-cli/installation)
- DuckDB (https://duckdb.org/docs/installation/)
- GitLFS (https://git-lfs.github.com/)

## Setup

Clone this repo (requires [git-lfs](https://git-lfs.github.com/))

Run poetry install to set up dependencies:

```
poetry install
```

## Database Details

We are using DuckDB in this exercise. DuckDB is a SQL database that is designed to be embedded in other applications. It is a great tool for data exploration and analysis, and is also a great tool for testing and development.

You can read more about it here: https://duckdb.org/.

## Defining dbt Models

Define dbt models in the `src/models/movies` directory. You will see a couple of samples already in place. Note the
pattern for referencing source tables, for example:

- `{{ source('movies', 'movie_metadata') }}`
- `{{ source('movies', 'movie_ratings') }}`

Also note the pattern for referencing other tables that are also calculated by dbt, for example:

- `{{ ref('all_movies') }}`

## Running DBT

We are using poetry to manage dependencies and to run dbt. To run dbt, first activate the poetry shell:

```
poetry shell
```

Then run dbt. You can pass commands to dbt to run specific models and ancestors. For more information on node selection you can read the documentation here: https://docs.getdbt.com/reference/node-selection/syntax

```
dbt run
dbt run --select all_movies
dbt run --select +all_movies
```

## Interview Exercise Instructions

Explore the sources schema – there are two tables: one containing movies, and another containing movie ratings.
Answer the following questions by using dbt to build a table for each item below:

**Take Home Exercise**

1. Read through the (DuckDB Data Types description)[https://duckdb.org/docs/sql/data_types/overview] and update the two sample models to cast columns to the best type for each column. Once you are done send an email back with a patch file and a description of why you chose the types you did to your interview team.

**In Person Exercise**

1. Which movies are most popular?

   - [ ] Create a table which includes each movie, along with the total number of ratings
         and average rating.
   - [ ] Create another table which only shows the top 10 movies by average rating, only
         considering movies with more than 100 ratings total.

1. How have movie ratings changed over time?
   - [ ] Create a table that summarizes ratings over time – i.e. for each year, how many movies were rated and what was the average rating?
   - [ ] Create an additional table that further breaks down the summary by genre. For
         example, for each year, how many movies were rated and what was the average
         rating for each genre?
   - [ ] Summarize by month (instead of year) since 2018
1. How do movie ratings differ by user?
   - [ ] Create a table which shows the number of ratings and average rating for each
         user
   - [ ] Create another table to show the favorite genres for each user - including one
         column for most watched genre, and another for top-rated genre
1. Go back over the code you wrote. Are there any areas of duplication that could be cleaned up by refactoring queries, utilizing DBT to introduce intermediate models that are reused, vs copying the same code across multiple related models?

## AI Exercise

If you are looking for the AI exercise please refer to [AI Exercise](AI-Interview.md).
