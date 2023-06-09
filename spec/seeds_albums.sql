-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE albums RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.
-- Note: example showed adding the data as seperate insert statments.


INSERT INTO "public"."albums" ("title", "release_year", "artist_id") VALUES ('Cat Sisters', 2023, 1);
INSERT INTO "public"."albums" ("title", "release_year", "artist_id") VALUES ('Cleo and Ninya', 2022, 2);