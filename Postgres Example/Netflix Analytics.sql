#Example query (PostgreSQL) from "https://bit.io/CharlotteChaze/BreakIntoTech"

#In this SQL code, I'm querying a database that's holding Nexflix data to answer below questions about the data using PostgresSQL.

#1. How many movie titles are there in the database? (movies only, not tv shows)
    SELECT
    count(*) as total_movies
    FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info"
    WHERE type ='Movie';

#2. When was the most recent batch of tv shows and/or movies added to the database?
    SELECT
    max(date_added)
    FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info";

#3. List all the movies and tv shows in alphabetical order.
    SELECT
    title
    FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info"
    ORDER BY title asc;

#4. Who was the Director for the movie Bright Star?
    SELECT
    people.director
    FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info" as titles
    JOIN "CharlotteChaze/BreakIntoTech"."netflix_people" as people
    ON titles.show_id = people.show_id
    WHERE titles.title = 'Bright Star';

#5. What is the oldest movie in the database and what year was it made?
    SELECT title, release_year 
    FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info"
    WHERE type = 'Movie'
    AND release_year <= 
    (SELECT MIN(release_year)   
    FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info"
    WHERE type = 'Movie'); 
