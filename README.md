# Postgres & Knex Reference and Practice

Personal reference repo for manipulating data in a database using Knex and PostgreSQL

## Setting up PostgreSQL

[PostgreSQL](https://www.postgresql.org/about/) is an open source relational database system.
1. Download and set up postgreSQL locally and set up environement variables for Windows.
2. Set `POSTGRES_DIR` to point to the root folder of your Postgres install.
3. Create a `PGDATA` environment variable that points to the folder that database files are stored in. Add a new entry for `PGDATA` setting it to `%POSTGRES_DIR%/data`.
4. Edit the `PATH` variable in order to run Postgres commands like `psql`, `pg_ctl`, `createuser`, and `createdb` from the command line. 
5. Edit the existing `PATH` variable by appending `%POSTGRES_DIR%\bin`.
6. Set up `pgpass.conf` (tells the Postgres client what password to use when attempting to connect to our local server as the postgres) and `pg_hba.conf` files. 

## Running PostgreSQL

1. Open command prompt and run `pg_ctl start`
2. Run `pg_ctl status` to check if server is running
3. Run `psql` or `psql -U postgres` to connect with postgres

## Set up

1. Clone this repository to your local machine `git@github.com:williamwdev/sql-practice.git`
2. `cd` into the cloned repository
3. Make a fresh start of the git history for this project with `rm -rf .git && git init`
4. Install the node dependencies `npm install`
5. Create your `.env` file to store your local settings
6. Edit the contents of the `package.json` to use NEW-PROJECT-NAME instead of `"name": "express-boilerplate",`


## Resources

[Knex.js](http://knexjs.org/)
[Knex CheatSheet](https://devhints.io/knex)
[PostgreSQL 13.0 Documentation](https://www.postgresql.org/docs/13/index.html)
[PostgreSQL tutorial cheat-sheet](https://www.postgresqltutorial.com/postgresql-cheat-sheet/)
[PostgreSQL cheat sheet](https://gist.github.com/Kartones/dd3ff5ec5ea238d4c546)