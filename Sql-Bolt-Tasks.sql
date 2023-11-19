-- Exercise 1 — Tasks

-- 1. Find the title of each film ✓
SELECT TITLE FROM movies;

-- 2. Find the director of each film ✓
SELECT DIRECTOR FROM movies;

-- 3. Find the title and director of each film ✓
SELECT TITLE , DIRECTOR FROM movies;


-- 4. Find the title and year of each film ✓
SELECT TITLE , YEAR FROM movies;


-- 5. Find all the information about each film ✓
SELECT * FROM movies;

Exercise 2 — Tasks

-- 1. Find the movie with a row id of 6 ✓
SELECT * FROM Movies WHERE id=6;

-- 2. Find the movies released in the years between 2000 and 2010 ✓
SELECT * FROM Movies WHERE YEAR BETWEEN 2000 AND 2010;

-- 3. Find the movies not released in the years between 2000 and 2010 ✓
SELECT * FROM Movies WHERE YEAR NOT BETWEEN 2000 AND 2010;

-- 4. Find the first 5 Pixar movies and their release year ✓
SELECT * FROM Movies WHERE ID<6;

-- Exercise 3 — Tasks

-- 1. Find all the Toy Story movies ✓
SELECT * FROM movies WHERE Title LIKE "Toy %";

-- 2. Find all the movies directed by John Lasseter ✓
SELECT * FROM movies WHERE Director LIKE "john %";

-- 3. Find all the movies (and director) not directed by John Lasseter ✓
SELECT * FROM movies WHERE Director NOT LIKE "john %";

-- 4. Find all the WALL-* movies ✓
SELECT * FROM movies WHERE Title LIKE "WALL%";

-- Exercise 4 — Tasks

-- 1. List all directors of Pixar movies (alphabetically), without duplicates ✓
SELECT DISTINCT Director FROM movies ORDER BY Director;

-- 2. List the last four Pixar movies released (ordered from most recent to least) ✓
SELECT * FROM movies ORDER BY year desc
limit  4;

-- 3. List the first five Pixar movies sorted alphabetically ✓
SELECT * FROM movies ORDER BY title
limit  5;

-- 4. List the next five Pixar movies sorted alphabetically ✓
SELECT * FROM movies ORDER BY title
-- limit  5 offset 5;

-- Exercise 5 — Tasks
SQL Review: Simple SELECT Queries

-- 1. List all the Canadian cities and their populations ✓
SELECT * FROM north_american_cities WHERE Country = "Canada";

-- 2. Order all the cities in the United States by their latitude from north to south ✓
SELECT * FROM north_american_cities WHERE Country LIKE "United States" ORDER BY Latitude DESC;

-- 3. List all the cities west of Chicago, ordered from west to east ✓
SELECT * FROM north_american_cities WHERE Longitude < -87.629798  ORDER BY Longitude;

-- 4. List the two largest cities in Mexico (by population) ✓
SELECT * FROM north_american_cities WHERE Country LIKE "Mexico" ORDER BY POPULATION DESC LIMIT 2;

-- 5. List the third and fourth largest cities (by population) in the United States and their population ✓
SELECT * FROM north_american_cities WHERE COUNTRY LIKE "United States" ORDER BY Population DESC LIMIT 2 OFFSET 2;

-- Exercise 6 — Tasks

-- 1. Find the domestic and international sales for each movie ✓
SELECT * FROM movies 
INNER JOIN Boxoffice ON 
ID = MOVIE_ID;

-- 2.Show the sales numbers for each movie that did better internationally rather than domestically ✓
SELECT * FROM movies 
INNER JOIN Boxoffice ON 
ID = MOVIE_ID
WHERE International_sales >  Domestic_sales;

-- 3. List all the movies by their ratings in descending order ✓
SELECT * FROM movies 
INNER JOIN Boxoffice ON 
ID = MOVIE_ID
ORDER BY Rating DESC;

-- Exercise 7 — Tasks

-- 1. Find the list of all buildings that have employees ✓
SELECT DISTINCT Building FROM employees;

-- 2. Find the list of all buildings and their capacity ✓
SELECT * FROM Buildings;

-- 3. List all buildings and the distinct employee roles in each building (including empty buildings) ✓
SELECT DISTINCT Building_name , Role FROM Buildings 
LEFT JOIN Employees ON
Building_name = Building;

-- Exercise 8 — Tasks

-- 1.Find the name and role of all employees who have not been assigned to a building ✓
SELECT Name , Role FROM employees
WHERE Building IS NULL;

-- 2. Find the names of the buildings that hold no employees ✓
SELECT * FROM Buildings 
LEFT JOIN Employees
ON Building_name = Building
WHERE Role IS NULL;

-- Exercise 9 — Tasks

-- 1. List all movies and their combined sales in millions of dollars ✓
SELECT Id , Title , (Domestic_sales + International_sales)/1000000 AS Total_sales  FROM movies
INNER JOIN BoxOffice
ON Id = Movie_id;

-- 2. List all movies and their ratings in percent ✓
SELECT Id , Title , ( Rating * 10) AS Rating FROM movies
Left JOIN BoxOffice 
ON Id = Movie_id;

-- 3. List all movies that were released on even number years ✓
SELECT * FROM movies
WHERE Year % 2 == 0;

-- Exercise 10 — Tasks

-- 1. Find the longest time that an employee has been at the studio ✓
    SELECT Name , Building , Role , Max(Years_employed) FROM employees;

-- 2. For each role, find the average number of years employed by employees in that role
SELECT Role , AVG(Years_employed) FROM employees
GROUP BY Role;

-- 3.  Find the total number of employee years worked in each building ✓
SELECT Building ,  SUM(Years_employed) FROM employees
GROUP BY Building;

-- Exercise 11 — Tasks

-- 1. Find the number of Artists in the studio (without a HAVING clause) ✓
SELECT Role , count(Role) FROM employees
WHERE Role like "Artist";

-- 2. Find the number of Employees of each role in the studio ✓
SELECT Role , count() FROM employees
GROUP BY Role;

-- 3. Find the total number of years employed by all Engineers ✓
SELECT Role , sum(years_employed) FROM employees
WHERE Role = "Engineer";

-- Exercise 12 — Tasks

-- 1. Find the number of movies each director has directed
SELECT *, count() FROM movies
GROUP BY Director;

-- 2. Find the total domestic and international sales that can be attributed to each director ✓
SELECT director, SUM(domestic_sales + international_sales) as Cumulative_sales_from_all_movies
FROM movies
    INNER JOIN boxoffice
        ON movies.id = boxoffice.movie_id
GROUP BY director;

-- Exercise 13 — Tasks

-- 1. Add the studio's new production, Toy Story 4 to the list of movies (you can use any director) ✓
INSERT INTO MOVIES 
VALUES (4 , "ToyStory 4" , "Ganesh" , 2025 , 120)

-- 2. Toy Story 4 has been released to critical acclaim! It had a rating of 8.7, and made 340 million domestically and 270 million internationally. Add the record to the BoxOffice table. ✓

INSERT INTO Boxoffice 
VALUES ( 4 , 8.7 , 340000000 , 270000000);

-- Exercise 14 — Tasks

-- 1. The director for A Bug's Life is incorrect, it was actually directed by John Lasseter ✓
UPDATE movies
SET director = "John Lasseter"
WHERE id = 2;

-- 2. The year that Toy Story 2 was released is incorrect, it was actually released in 1999 ✓
UPDATE Movies
SET Year = 1999
WHERE Id=3;

-- 3. Both the title and director for Toy Story 8 is incorrect! The title should be "Toy Story 3" and it was directed by Lee Unkrich ✓
UPDATE movies
SET Title = "Toy Story 3",
    Director = "Lee Unkrich"
where id = 11;

--  Exercise 15 — Tasks

-- 1. This database is getting too big, lets remove all movies that were released before 2005. ✓
DELETE FROM Movies 
WHERE Year < 2005;

-- 2. Andrew Stanton has also left the studio, so please remove all movies directed by him. ✓
DELETE FROM Movies
WHERE Director Like "Andrew Stanton";

--Exercise 16 — Tasks

-- 1. Create a new table named Database with the following columns:
-- – Name A string (text) describing the name of the database
-- – Version A number (floating point) of the latest version of this database
-- – Download_count An integer count of the number of times this database was downloaded
-- This table has no constraints. ✓

CREATE TABLE movies (
    Name TEXT,
    version float,
    Download_count integer
);

--Exercise 17 — Tasks

-- 1. Add a column named Aspect_ratio with a FLOAT data type to store the aspect-ratio each movie was released in. ✓
ALTER TABLE Movies
ADD column Aspect_ratio float ;

--2. Add another column named Language with a TEXT data type to store the language that the movie was released in. Ensure that the default for this language is English. ✓
ALTER TABLE Movies
  ADD COLUMN Language TEXT DEFAULT "English";

  --Exercise 18 — Tasks

--1. We've sadly reached the end of our lessons, lets clean up by removing the Movies table
DROP TABLE Movies;

--2. And drop the BoxOffice table as well
DROP TABLE BoxOffice;
