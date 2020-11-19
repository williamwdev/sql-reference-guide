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

## Setting up Knex.js with PostgreSQL

[Knex.js](http://knexjs.org/) is a SQL query builder for Postgres, MSSQL, MySQL, MariaDB, SQLite3, Oracle, and Amazon Redshift.
1. Run `npm install knex --save`
2. Run `npm install pg`
3. Initialize the library inside file:
``` javascript 
require('dotenv').config();
const knex = require('knex');

const knexInstance = knex({
  client: 'pg',
  connection: process.env.DATABASE_URL,
});
```

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

## SQL Review

SQL (Structured Query Language) is a language designed to manage data in a RDBMS (Relational Database Management System).

**Database Related Commands**
1. `SHOW DATABASES;` to see currently available databases
2. `CREATE DATABASE <database_name>;` to create a new database
3. `USE <database_name>;` to select a database to use
4. `SOURCE <path_of_.sql_file>;` to import SQL commands from .sql file
5. `DROP DATABASE <database_name>;` to delete a database

**Table Related Commands**
1. **`SHOW TABLES`** to see currently available tables in a database
2. To create a **new table**:
```sql
CREATE TABLE <table_name1> (
    <col_name1> <col_type1>, 
    <col_name2> <col_type2>, 
    <col_name3> <col_type3>
    PRIMARY KEY (<col_name1>),
    FOREIGN KEY (<col_name2>) REFERENCES <table_name2>(<col_name2>)
);
```
**Integrity contraints in CREATE TABLE**
- NOT NULL
- PRIMARY KEY (col_name1, col_name2,...)
- FOREIGN KEY (col_namex1, …, col_namexn) REFERENCES table_name(col_namex1, …, col_namexn)
3. **`DESCRIBE <table_name>;`** to describe columns of a table
4. **Insert into a table**
```sql
INSERT INTO <table_name> (<col_name1>, <col_name2>, <col_name3>, …)
    VALUES (<value1>, <value2>, <value3>, …);
```
5. **Update a table**
```sql
UPDATE <table_name>
    SET <col_name1> = <value1>, <col_name2> = <value2>, ...
    WHERE <condition>;
```
6. **Delete all contents of a table**
`DELETE FROM <table_name>;`
7. **Delete a table**
`DROP TABLE <table_name>;`

**Querying Related Commands**
1. **SELECT**
```sql
SELECT <col_name1>, <col_name2>, …
     FROM <table_name>;
```
2. **SELECT DISTINCT**
```sql
SELECT DISTINCT <col_name1>, <col_name2>, …
     FROM <table_name>;
```
3. **WHERE**
```sql
SELECT <col_name1>, <col_name2>, …
     FROM <table_name>
     WHERE <condition>;
```
4. **GROUP BY** (often used with aggregate functions such as COUNT, MAX, MIN, SUM and AVG to group the result-set)
```sql
SELECT <col_name1>, <col_name2>, …
     FROM <table_name>
     GROUP BY <col_namex>;
```
5. **HAVING**
```sql
SELECT <col_name1>, <col_name2>, ...
    FROM <table_name>
    GROUP BY <column_namex>
    HAVING <condition>
```
6. **ORDER BY** (sort a result set in ascending or descending order)
```sql
SELECT <col_name1>, <col_name2>, …
FROM <table_name>
ORDER BY <col_name1>, <col_name2>, … ASC|DESC;
```
7. **BETWEEN** (used to select data within a given range)
```sql
SELECT <col_name1>, <col_name2>, …
    FROM <table_name>
    WHERE <col_namex> BETWEEN <value1> AND <value2>;
```
8. **LIKE** (used in a WHERE clause to search for a specified pattern in text)
- % (Zero, one, or multiple characters)
- _(A single character)
```sql
SELECT <col_name1>, <col_name2>, …
    FROM <table_name>
    WHERE <col_namex> LIKE <pattern>;
```
9. **IN** (allow multiple values within a WHERE clause)
```sql
SELECT <col_name1>, <col_name2>, …
    FROM <table_name>
    WHERE <col_namen> IN (<value1>, <value2>, …);
```
10. **JOIN** (used to combine values of two or more tables based on common attributes within them)
![Join Image](/images/join_image.png)
```sql
SELECT <col_name1>, <col_name2>, …
    FROM <table_name1>
    JOIN <table_name2> 
    ON <table_name1.col_namex> = <table2.col_namex>;
```
11. **Views** (virtual SQL tables created using a result set of a statement)
```sql
CREATE VIEW <view_name> AS
    SELECT <col_name1>, <col_name2>, …
    FROM <table_name>
    WHERE <condition>;
```
```sql
DROP VIEW <view_name>;
```
12. **Aggregate Functions**
- COUNT(col_name) — Returns the number of rows
- SUM(col_name) — Returns the sum of the values in a given column
- AVG (col_name)— Returns the average of the values of a given column
- MIN(col_name) — Returns the smallest value of a given column
- MAX(col_name) — Returns the largest value of a given column
13. **Nested Subqueries** (SQL queries which include a SELECT-FROM-WHERE expression that is nested within another query)
```sql
SELECT DISTINCT course_id 
    FROM section 
    WHERE semester = ‘Fall’ AND year= 2009 AND course_id IN (
        SELECT course_id 
            FROM section 
            WHERE semester = ‘Spring’ AND year= 2010
    );
```

## Additional SQL Concepts
- `LIKE` can be used with wildcards such as `%` and `_` to match various characters.
- Aggregate functions take multiple rows of data and combine them into one number
- `COUNT` is one of the most widely-used aggregate function `SELECT COUNT(col_name) FROM table`
- Null is the value of an empty entry. `SELECT (0 IS NOT NULL) AND ('' IS NOT NULL)`
- `COUNT(*)` counts rows as long as ANY one of their columns is non-null. `SELECT COUNT(*) FROM table`
- `CASE WHEN` block acts as a big if-else statement
```sql
CASE
    WHEN <clause> THEN <result>
    WHEN <clause> THEN <result>
    ...
    ELSE <result>
END
```
- `SELECT DISTINCT` returns unique entries (no duplication)
- `GROUP BY` allows us to split up the dataset and apply aggregate functions within each group, resulting in one row per group
- `HAVING` is useful for filtering result of grouping and aggregration


## Additional Resources

### Knex Related Resources
- [Knex.js](http://knexjs.org/)
- [Knex CheatSheet](https://devhints.io/knex)

### PostgreSQL Related Resources
- [PostgreSQL 13.0 Documentation](https://www.postgresql.org/docs/13/index.html)
- [PostgreSQL Tutorial](https://www.postgresqltutorial.com/)
- [PostgreSQL tutorial cheat-sheet](https://www.postgresqltutorial.com/postgresql-cheat-sheet/)
- [PostgreSQL cheat sheet](https://gist.github.com/Kartones/dd3ff5ec5ea238d4c546)
- [PostgreSQL Exercises](https://pgexercises.com/)
- [PostgreSQL Tutorialspoint](https://www.tutorialspoint.com/postgresql/index.htm)

### SQL Related Resources

- [SQL Cheat Sheet](https://towardsdatascience.com/sql-cheat-sheet-for-interviews-6e5981fa797b)
- [SQLZoo](https://sqlzoo.net/wiki/SQL_Tutorial)
- [WebDevSimplified SQL](https://github.com/WebDevSimplified/Learn-SQL)
- [SQL Database Programming eBook](https://github.com/PacktPublishing/learn-sql-database-programming)
- [SQLBolt](https://sqlbolt.com/)
- [GalaXQL](http://sol.gfxile.net/galaxql.html)
- [Mode SQL tutorial](https://mode.com/sql-tutorial/)
- [Datacamp intro to SQL](https://www.datacamp.com/courses/introduction-to-sql)
- [Select Star SQL](https://selectstarsql.com/) - Great resource for interactive learning
- [SQL Murder Mystery](http://mystery.knightlab.com/walkthrough.html)
- [SQLcourse](http://www.sqlcourse.com/)
- [SQLcourse 2](http://www.sqlcourse2.com/)
- [Codeacademy](https://www.codecademy.com/learn/learn-sql)
- [SQL tutorial](http://www.sql-tutorial.ru/en/content.html)
- [Kaggle SQL](https://www.kaggle.com/learn/intro-to-sql)
- [Kaggle Advanced SQL](https://www.kaggle.com/learn/advanced-sql)
- [Studybyyourself](http://studybyyourself.com/seminar/sql/course/?lang=en)
- [Stratascratch](https://www.stratascratch.com/)
- [Sololearn](https://www.sololearn.com/Course/SQL/)
- [w3school](https://www.w3schools.com/sql/default.asp)
- [SQLite](https://sqlite.org/index.html)








