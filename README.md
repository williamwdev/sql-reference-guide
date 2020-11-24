# Postgres, Knex and SQL Reference and Practice Guide

Personal reference repo for manipulating data in a database using Knex and PostgreSQL. 
Resources and review for SQL.

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
- `JOINS` are used to create an augmented table because the original didn't contain the information we needed.
```sql
SELECT column, another_table_column, …
FROM mytable
INNER JOIN another_table 
    ON mytable.id = another_table.id
WHERE condition(s)
ORDER BY column, … ASC/DESC
LIMIT num_limit OFFSET num_offset;
```
- `INNER JOIN` is a process that matches rows from the first table and second table which have the same key (as defined by the ON constraint) to create a result row with the combined columns from both tables. `INNER JOIN` and `JOIN` are equivalent
- `OUTER JOIN` is used when two tables have asymmetric data to ensure that the data you need is not left out of the results
```sql
SELECT column, another_column, …
FROM mytable
INNER/LEFT/RIGHT/FULL JOIN another_table 
    ON mytable.id = another_table.matching_id
WHERE condition(s)
ORDER BY column, … ASC/DESC
LIMIT num_limit OFFSET num_offset;
```
- When joining table A to table B:
- `LEFT JOIN` simply includes rows from A regardless of whether a matching row is found in B
- `RIGHT JOIN` is the same, but reversed, keeping rows in B regardless of whether a match is found in A
- `FULL JOIN` simply means that rows from both tables are kept, regardless of whether a matching row exists in the other table
- When using any of the above joins, you need to account and deal with `NULL` in the result and constraints
- When outer-joining two tables with asymmetric data, you can test a column for `NULL` values in a `WHERE` clause by using either the `IS NULL` or `IS NOT NULL` constraint
```sql
SELECT column, another_column, …
FROM mytable
WHERE column IS/IS NOT NULL
AND/OR another_condition
AND/OR …;
```
- `AS` keyword is used to give descriptive alias to expressions used in the `SELECT` part of the query
```sql
SELECT col_expression AS expr_description, …
FROM mytable;
```
- Additionally, regular columns and tables can also have aliases to make them easier to reference in the output and helps in simplifying more complex queries
```sql
SELECT column AS better_column_name, …
FROM a_long_widgets_table_name AS mywidgets
INNER JOIN widget_sales
  ON mywidgets.id = widget_sales.widget_id;
```
- Query with aggregate functions over all the rows
```sql
SELECT AGG_FUNC(column_or_expression) AS aggregate_description, …
FROM mytable
WHERE constraint_expression;
```
- Common aggregate functions
1. `COUNT(*), COUNT(column)` = Common function used to count the number of rows in the group if no column name is specified. Otherwise, count the number of rows in the group with non-NULL values in the specified column
2. `MIN(column)` = Finds the smallest numerical value in the specified column for all rows in the group
3. `MAX(column` = Finds the largest numerical value in the specified column for all rows in the group
4. `AVG(column)` = Finds the average numerical value in the specified column for all rows in the group
5. `SUM(column)` = Finds the sum of all numerical values in the specified column for the rows in the group
- Grouped aggregate functions
```sql
SELECT AGG_FUNC(column_or_expression) AS aggregate_description, …
FROM mytable
WHERE constraint_expression
GROUP BY column;
```
- `HAVING` clause is used specifically with the `GROUP BY` clause to allow us to filter grouped rows from the result set
```sql
SELECT group_by_column, AGG_FUNC(column_expression) AS aggregate_result_alias, …
FROM mytable
WHERE condition
GROUP BY column
HAVING group_condition;
```
- Order of Execution of a Query (Each query begins with finding the data that we need in a database, and then filtering that data down into something that can be processed and understood as quickly as possible)
```sql
SELECT DISTINCT column, AGG_FUNC(column_or_expression), …
FROM mytable
    JOIN another_table
      ON mytable.column = another_table.column
    WHERE constraint_expression
    GROUP BY column
    HAVING constraint_expression
    ORDER BY column ASC/DESC
    LIMIT count OFFSET COUNT;
```
- In SQL, the database schema is what describes the structure of each table, and the datatypes that each column of the table can contain. This fixed structure is what allows a database to be efficient, and consistent despite storing millions or even billions of rows.
- `INSERT` statement with values for all columns
```sql
INSERT INTO mytable
VALUES (value_or_expr, another_value_or_expr, …),
       (value_or_expr_2, another_value_or_expr_2, …),
       …;
```
- `INSERT` statement with specific columns (when you have incomplete data and the table contains columns that support default values)
```sql
INSERT INTO mytable
(column, another_column, …)
VALUES (value_or_expr, another_value_or_expr, …),
      (value_or_expr_2, another_value_or_expr_2, …),
      …;
```
- `INSERT` statement with expressions (use mathematical and string expressions with the values that you are inserting)
```sql
INSERT INTO boxoffice
(movie_id, rating, sales_in_millions)
VALUES (1, 9.9, 283742034 / 1000000);
```
- `UPDATE` statement with values (takes multiple column/value pairs, and applying those changes to each and every row that satisfies the constraint in the `WHERE` clause)
```sql
UPDATE mytable
SET column = value_or_expr, 
    other_column = another_value_or_expr, 
    …
WHERE condition;
```
- NOTE: Always write the constraint first and test it in a `SELECT` query to make sure you are updating the right rows, and only then writing the column/value pairs to update
- `DELETE` statement with condition (if there is no `WHERE` constraint, then all rows will be removed)
```sql
DELETE FROM mytable
WHERE condition;
```
- NOTE: Recommended to run the constraint in a `SELECT` query first to ensure that you are removing the right rows. Without a proper backup or test database, it is downright easy to irrevocably remove data so always read your `DELETE` statements wice and execute once.
- `CREATE TABLE` statement with optional table constraint and default value
```sql
CREATE TABLE IF NOT EXISTS mytable (
    column DataType TableConstraint DEFAULT default_value,
    another_column DataType TableConstraint DEFAULT default_value,
    …
);
```

- Table data types
1. `INTEGER`, `BOOLEAN` = interger can store whole integer values like the count of a number or an age. Boolean value is just represented as an integer value of just 0 or 1
2. `FLOAT`, `DOUBLE`, `REAL` = floating point datatypes can store more precise numerical data like measurements or fractional values.
3. `CHARACTER(num_chars)`, `VARCHAR(num_chars)`, `TEXT` = text based datatypes can store strings and text in all sorts of locales. Both the `CHARACTER` and `VARCHAR(variable character)` types are specified with the max number of characters that they can store.
4. `DATE`, `DATETIME` = SQL can also store data and time stamps to keep track of time series and event data. (Manipulating data across timezones can be tricky)
5. `BLOB` = SQL can store binary data in blobs right in the database. These values are often opaque to the database, so you usually have to store them with the right metadata to requery them

- Table constraints
1. `PRIMARY KEY` = Values in this column are unique, and each value can be used to identify a single row in this table
2. `AUTOINCREMENT` = For integer values, this means that the value is automatically filled in and incremented with each row insertion.
3. `UNIQUE` = Values in this column have to be unique, so you can't insert another row with the same value in this column as another row in the table. Differs from the `PRIMARY KEY` in that it doesn't have to be a key for a row in the table
4. `NOT NULL` = Inserted value can not be `NULL`
5. `CHECK` (expression) = Allows you to run a more complex expression to test whether the values inserted are valid (check that values are positive, or greater than a specific size, or start with a certain prefix, etc)
6. `FOREIGN KEY` = consisgtency check which ensures that each value in this column corresponds to another value in a column in another table.

- Example table schema
```sql
CREATE TABLE movies (
    id INTEGER PRIMARY KEY,
    title TEXT,
    director TEXT,
    year INTEGER, 
    length_minutes INTEGER
);
```

- `ALTER TABLE` to add new column(s)
```sql
ALTER TABLE mytable
ADD column DataType OptionalTableConstraint 
    DEFAULT default_value;
```
- `ALTER TABLE` to remove column(s)
```sql
ALTER TABLE mytable
DROP column_to_be_deleted;
```
- `ALTER TABLE` to rename table name
```sql
ALTER TABLE mytable
RENAME TO new_table_name;
```
- `DROP TABLE IF EXISTS` statement removes an entire table including all of its data and metadata
```sql
DROP TABLE IF EXISTS mytable;
```

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

- [SQLBolt](https://sqlbolt.com/) - One of the better interactive interfaces for learning and practicing in browser
- [Select Star SQL](https://selectstarsql.com/) - Great resource for interactive learning
- [SQL Cheat Sheet](https://towardsdatascience.com/sql-cheat-sheet-for-interviews-6e5981fa797b)
- [SQLZoo](https://sqlzoo.net/wiki/SQL_Tutorial)
- [WebDevSimplified SQL](https://github.com/WebDevSimplified/Learn-SQL)
- [SQL Database Programming eBook](https://github.com/PacktPublishing/learn-sql-database-programming)
- [GalaXQL](http://sol.gfxile.net/galaxql.html)
- [Mode SQL tutorial](https://mode.com/sql-tutorial/)
- [Datacamp intro to SQL](https://www.datacamp.com/courses/introduction-to-sql)
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








