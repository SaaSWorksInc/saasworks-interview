# AI Exercise

| Note                                                                       |
| -------------------------------------------------------------------------- |
| This exercise builds on top of the DBT exercise in the [README](README.md) |

## Prerequisites

- Poetry (https://python-poetry.org/docs/#installation)
- DBT Knowledge (https://docs.getdbt.com/dbt-cli/installation)
- DuckDB (https://duckdb.org/docs/installation/)
- GitLFS (https://git-lfs.github.com/)
- Knowledge of GPT models and AI (https://openai.com/research/gpt-4/)
- Free OpenAI account (https://platform.openai.com/docs/overview)

## Setup

Clone this repo (requires [git-lfs](https://git-lfs.github.com/))

Run poetry install to set up dependencies:

```
poetry install
```

## Database Details

We are using DuckDB in this exercise. DuckDB is an mbeddable database like SQLLite however it's highly scalable and runs in memory for OLAP/Analytics. It is a great tool for data exploration and analysis, and is also a great tool for testing and development.

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

## AI Interview Task

Your task is to generate a GPT model that will use the underlying data from the DuckDB database. The model should allow an end user to ask questions about the data in a natural language format. The model should be able to understand the question and provide a relevant answer based on the data.

For example, if an end user asks "What is the highest grossing movie?", the model should be able to understand the question, query the database, and provide the correct answer.

Please provide the following:

- A brief explanation of your approach to the problem
- The code for your GPT model
- Examples of the model's output when asked several different questions about the data
- Any tests you have written for your code
