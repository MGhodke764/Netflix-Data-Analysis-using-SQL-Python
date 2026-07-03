CREATE DATABASE movies_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

CREATE DATABASE movies_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE movies_db;

SHOW TABLES;
SELECT COUNT(*)
FROM mymoviedb_ascii_clean;


RENAME TABLE mymoviedb_ascii_clean TO movies;

#View Data
SELECT *
FROM movies
LIMIT 10;

SELECT COUNT(*)
from movies;

DESCRIBE movies;

## Data Cleaning ##

#check missing values 
SELECT *
FROM movies
WHERE Genre IS NULL
OR Vote_Average IS NULL
OR Title IS NULL;movies

#Duplicate Check
SELECT Title,
COUNT(*) AS duplicate_count
FROM movies
GROUP BY Title
HAVING COUNT(*) > 1;

#Then we checked actual duplicate rows.
SELECT COUNT(*) AS total_duplicate_titles
FROM (
    SELECT Title
    FROM movies
    GROUP BY Title
    HAVING COUNT(*) > 1
) AS duplicates;


SELECT COUNT(*) - COUNT(DISTINCT CONCAT(
Title,
Release_Date,
Genre,
Vote_Average
)) AS exact_duplicates
FROM movies;

## Data Analysis in SQL
#Top 10 Popular Movies
SELECT Title,
Popularity
FROM movies
ORDER BY Popularity DESC
LIMIT 10;

#Create Aggregated Table
CREATE TABLE movie_summary AS
SELECT
Genre,
COUNT(*) AS Total_Movies,
ROUND(AVG(Vote_Average),2) AS Avg_Rating,
ROUND(AVG(Popularity),2) AS Avg_Popularity
FROM movies
GROUP BY Genre;

SELECT *
FROM movie_summary;

SELECT Genre,
ROUND(AVG(Vote_Average),2) AS Avg_Rating
FROM movies
GROUP BY Genre
ORDER BY Avg_Rating DESC;
