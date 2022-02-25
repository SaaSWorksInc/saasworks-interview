# DBT Exercise

## Prerequisites

* Docker Desktop (https://www.docker.com/products/docker-desktop)

## Setup

Clone this repo (requires [git-lfs](https://git-lfs.github.com/)) or download as a ZIP file here:

https://github.com/SaaSWorksInc/dbt-exercise/archive/refs/heads/master.zip

Run the start script in order to start the database and set up the source data tables:

```
./bin/start.sh
```

When you are ready to stop the database and tear down the tables, run:

```
./bin/stop.sh
```

## Database Details

You can connect to the sample Postgres database with your preferred tool(s) using the following settings:

* Host: localhost
* Port: 5432
* Username: dbt
* Password: dbt
* Database: movies

There are two schemas:

* `sources` - this schema contains two source data tables: `movie_metadata` and `movie_ratings`
* `transform` - this schema is empty at first; when you run dbt, the resulting tables will go here

## Defining dbt Models

Define dbt models in the `src/models/movies` directory. You will see a couple of samples already in place. Note the
pattern for referencing source tables, for example:

* `{{ source('movies', 'movie_metadata') }}`
* `{{ source('movies', 'movie_ratings') }}`

Also note the pattern for referencing other tables that are also calculated by dbt, for example:

* `{{ ref('all_movies') }}`

## Running DBT

To run dbt via Docker, use the following command

```
./bin/dbt
```

You can pass command-line options to dbt as usual with this form of command. For example, to execute a single model:

```
./bin/dbt run -m all_movies
```

To run a model plus all ancestor models that are required to run that model, prefix with a `+`:

```
./bin/dbt run -m +all_movies
```

To simply run all models:

```
./bin/dbt run
```
