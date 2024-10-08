# DBT Exercise

## Prerequisites

- Poetry (https://python-poetry.org/docs/#installation)
- DBT Knowledge (https://docs.getdbt.com/dbt-cli/installation)
- DuckDB (https://duckdb.org/docs/installation/)
- GitLFS (https://git-lfs.github.com/)

## Setup

**Important:** You need to install [git-lfs](https://git-lfs.github.com/) before cloning this repository. If you're on a Mac using Homebrew, you can do:

```
brew install git-lfs 
git lfs install
```

After git-lfs has been installed, clone this repo:

```
git clone https://github.com/saasworksinc/saasworks-interview.git
```

Run poetry install to set up dependencies:

```
poetry install
```

## Database Details

We are using DuckDB and DBT in this exercise. 

DuckDB is a SQL database that is designed to be embedded in other applications. It is a great tool for data exploration and analysis, and is also a great tool for testing and development. You can read more about it here: https://duckdb.org/.

DBT is a data transformation framework that enables you to build and execute multi-step data transformations. You can read more about it here: https://www.getdbt.com/product/what-is-dbt.

## Defining dbt Models

Define dbt models in the `src/models/movies` directory. You will see a couple of samples already in place. When you run DBT, it will find the `*.sql` files under the `models` directory. For each file, it will run the query contained within, and create a table of the same name, containing the results of the query. 

Note the pattern for referencing other tables that are also calculated by dbt, for example:

- `{{ ref('all_movies') }}`

When DBT encounters a `ref`, it will know that one model depends on another. For example, the `movie_count` model depends on `all_movies`. DBT will handle running models in the appropriate order. `ref` gives you a way to have one model consume the results of one or more predecessor models in your DBT project.

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

## Inspecting Data

You can inspect data within duckdb. After running dbt for the first time (as shown above), a file `local.db` will be created, which is a duckdb database file. You can open this with the duckdb CLI 
as follows:

```
duckdb local.db
```

Of course, you can also use your preferred SQL IDE, such as DataGrip, TablePlus, etc, assuming that it supports DuckDB.

Generally speaking, DuckDB's SQL syntax is fully featured, friendly, and mostly Postgres-compatible. Their documentation is quite good as well. 

## Interview Exercise Instructions

Explore the sources schema – there are two tables: one containing movies, and another containing movie ratings.
Answer the following questions by using dbt to build a table for each item below:

**Take Home Exercise**

1. Read through the (DuckDB Data Types description)[https://duckdb.org/docs/sql/data_types/overview] and update the `all_movies` and `all_ratings` models to cast columns to the best type for each column. Once you are done send an email back with a patch file and a description of why you chose the types you did to your interview team.

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
