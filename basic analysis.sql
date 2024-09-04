/*
1. Top 10 Movie Genre
*/

SELECT TOP 10 ng.genre, COUNT(ng.genre) AS total_movies
FROM movies_and_shows ms
INNER JOIN genre ng on ms.show_id = ng.show_id
WHERE ms.type = 'Movie'
GROUP BY ng.genre
ORDER BY total_movies DESC

/*
2. Top 10 TV Show Genre
*/
SELECT TOP 10 ng.genre, COUNT(ng.genre) AS total_show
FROM movies_and_shows ms
INNER JOIN genre ng on ms.show_id = ng.show_id
WHERE ms.type = 'TV Show'
GROUP BY ng.genre
ORDER BY total_show DESC

/*
3. Top 10 Movie Ratings
*/

SELECT TOP 10 rating, COUNT(rating) as total_movie
FROM movies_and_shows
WHERE type = 'Movie'
GROUP BY rating
ORDER BY total_movie DESC

/*
4. Top 10 TV Show Ratings
*/

SELECT TOP 10 rating, COUNT(rating) as total_show
FROM movies_and_shows
WHERE type = 'TV Show'
GROUP BY rating
ORDER BY total_show DESC


/*
5. Total Movies and TV Shows
*/

SELECT type, COUNT(type) as total
FROM movies_and_shows
GROUP BY type
ORDER BY total DESC

/*
6. Movies distribution by countries
*/
SELECT nc.country, COUNT(nc.country) as total_movies
FROM movies_and_shows ms
INNER JOIN country nc on ms.show_id = nc.show_id
WHERE ms.type = 'Movie'
GROUP BY nc.country
ORDER BY total_movies DESC

/*
6. TV Shows distribution by countries
*/
SELECT nc.country, COUNT(nc.country) as total_shows
FROM movies_and_shows ms
INNER JOIN country nc on ms.show_id = nc.show_id
WHERE ms.type = 'TV Show'
GROUP BY nc.country
ORDER BY total_shows DESC