-- DATA ANALYSIS

/*
1. For each director count the no of movies and tv shows created by them in sepearte columns
*/
SELECT nd.director,
	COUNT(DISTINCT CASE WHEN ms.type = 'Movie' THEN ms.show_id END) AS no_of_movies,
	COUNT(DISTINCT CASE WHEN ms.type = 'TV Show' THEN ms.show_id END) AS no_of_shows
FROM movies_and_shows ms
INNER JOIN directors nd ON ms.show_id = nd.show_id
GROUP BY nd.director


/* 
2. List of directors who have created both movies and TV shows
*/
SELECT nd.director,
	COUNT(DISTINCT CASE WHEN ms.type = 'Movie' THEN ms.show_id END) AS no_of_movies,
	COUNT(DISTINCT CASE WHEN ms.type = 'TV Show' THEN ms.show_id END) AS no_of_shows
FROM movies_and_shows ms
INNER JOIN directors nd ON ms.show_id = nd.show_id
GROUP BY nd.director
HAVING COUNT(DISTINCT ms.type) > 1


/* 
3. Which country has highest number of comedy movies
*/
SELECT top 1 nc.country, COUNT(DISTINCT ng.show_id) AS no_of_movies
FROM genre ng
INNER JOIN country nc on ng.show_id = nc.show_id
INNER JOIN movies_and_shows ms on ng.show_id = nc.show_id
WHERE ng.genre = 'Comedies' and ms.type = 'Movie'
GROUP BY nc.country
ORDER BY no_of_movies DESC

/*
4. Which director has maximun number of movies released(on netflix which is date added) for each year
*/

WITH cte AS(
			SELECT YEAR(date_added) AS date_year, nd.director, COUNT(DISTINCT ms.show_id) as no_of_movies
			FROM movies_and_shows ms
			INNER JOIN directors nd on ms.show_id = nd.show_id
			WHERE type='Movie'
			GROUP BY nd.director, YEAR(date_added)
), cte2 AS(
			SELECT *
			, ROW_NUMBER() OVER(PARTITION BY date_year ORDER BY no_of_movies DESC, director) AS rn
			from cte)
SELECT * FROM cte2 WHERE rn = 1


/*
5. What is average duration of movies in each genre
*/
SELECT ng.genre, AVG(CAST(REPLACE(ms.duration,' min','') AS int)) as duration_int
FROM movies_and_shows ms
INNER JOIN genre ng on ms.show_id =  ng.show_id
WHERE type = 'Movie'
GROUP BY ng.genre
ORDER BY duration_int

/*
6. Find the list of director who have created horror and comedy movies both
display director names along with number of comedy and horror movies directed by them
*/

SELECT nd.director,
	COUNT(DISTINCT CASE WHEN ng.genre = 'Comedies' THEN ng.show_id END) AS no_of_comedy,
	COUNT(DISTINCT CASE WHEN ng.genre = 'Horror Movies' THEN ng.show_id END) AS no_of_horror

FROM movies_and_shows ms
INNER JOIN genre ng on ms.show_id = ng.show_id
INNER JOIN directors nd on ms.show_id = nd.show_id
WHERE type = 'Movie' and ng.genre in ('Comedies','Horror Movies')
GROUP BY nd.director
HAVING COUNT(DISTINCT ng.genre) = 2
