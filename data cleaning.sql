-- removing duplicates
SELECT show_id, COUNT(*)
FROM new_netflix
GROUP BY show_id
HAVING COUNT(*) > 1


SELECT * FROM new_netflix
WHERE CONCAT(title, type) IN (
SELECT CONCAT(title , type)
FROM new_netflix
GROUP BY title, type
HAVING COUNT(*) > 1)
ORDER BY title


WITH cte AS (
SELECT * 
, ROW_NUMBER() OVER(PARTITION BY title, type ORDER BY show_id) AS rn
FROM new_netflix
)
SELECT * FROM cte 
WHERE rn=1

-- columns like director, actors and genre have multiple values
-- creating a different table for all the above column which will have one value for one show_id

-- creating a new directors table
SELECT IDENTITY(INT,1,1) AS id , show_id, TRIM(VALUE) AS director
INTO directors
FROM new_netflix
CROSS APPLY string_split(director,',')

select * from directors

-- creating a new cast_member table
SELECT IDENTITY(INT,1,1) AS id , show_id, TRIM(VALUE) AS cast_member
INTO cast_member
FROM new_netflix
CROSS APPLY string_split(cast,',')

select * from cast_member

-- creating a new table for genre

SELECT IDENTITY(INT,1,1) AS id , show_id, TRIM(VALUE) AS genre
INTO genre
FROM new_netflix
CROSS APPLY string_split(listed_in,',')

SELECT * FROM genre

-- creating a new table for country
SELECT IDENTITY(INT,1,1) AS id , show_id, TRIM(VALUE) AS country
INTO country
FROM new_netflix
CROSS APPLY string_split(country,',')

SELECT * FROM country


-- populating null values in the country column using the directors data using data mapping

SELECT director, country
FROM country nc
INNER JOIN directors nd on nc.show_id = nd.show_id
group by director, country

-- mapping missing values in the country column
INSERT INTO country
SELECT show_id, map.country
FROM new_netflix nn
INNER JOIN (
			SELECT director, country
			FROM country nc
			INNER JOIN directors nd on nc.show_id = nd.show_id
			group by director, country)
map on nn.director = map.director
WHERE nn.country IS NULL


---------------------------------------------------------------------
select * from new_netflix where duration is null -- the value of duration is in the ratings column
-- so populating duration with null wherever the rating is null

---------

-- final data after cleaning and sorting
WITH cte AS (
SELECT * 
, ROW_NUMBER() OVER(PARTITION BY title, type ORDER BY show_id) AS rn
FROM new_netflix
)
SELECT show_id, type, title, CAST(date_added AS date) AS date_added, release_year, rating, CASE WHEN duration IS NULL THEN rating ELSE duration END AS duration, description
INTO movies_and_shows -- adding the final data in new table
FROM cte 
WHERE rn=1