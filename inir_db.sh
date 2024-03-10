#!/usr/bin/env bash
set -x
set -eo pipefail

DB_USER=${POSTGRES_USER:=postgres}

DB_PASSSWORD="${POSTGRES_PASSWORD:=password}"

DB_NAME"${POSTGRES_DB:=mydatabase}"

DB_PORT="${POSTGRES_PORT:=5432}"

DB_HOST="${POSTGRES_HOST:=localhost}"

docker run \
	-e POSTGRES_USER=${DB_USER} \
	-e POSTGRES_PSSWORD=${DB_PASSWORD} \
	-e POSTGRES_DB=${DB_NAME} \
	-p "${DB_PORT}":5432 \
	-d postgres \
	postgres -N 1000



export PGPASSWORD="${DB_PASSWORD}"
until psql -h "${DB_HOST}" -U "${DB_USER}" -p "{DB_PORT}" -d "postgres" -c '\p'; do
	>&2 echo "Postgres is still unavailable - sleeping"
	sleep 1
done

DATABASE_URL=postgres://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}
export DATABASE_URL
sqlx database create
