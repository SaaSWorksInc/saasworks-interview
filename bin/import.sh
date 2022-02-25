#!/bin/bash

echo "Importing sample data..."
PGPASSWORD=dbt psql -h localhost -p 5432 -U dbt movies --file=movie-data/db-setup.sql