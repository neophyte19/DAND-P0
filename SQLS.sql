SELECT 
  global_year AS year, 
  MAX(global_avg) AS global_avg, 
  MAX(bangalore_city_avg) AS bangalore_city_avg, 
  MAX(sanjose_city_avg) AS sanjose_city_avg
FROM 
(
  SELECT 
	global.year as global_year, 
    global.avg_temp as global_avg, 
    CASE WHEN city.city = 'Bangalore' THEN city.avg_temp END AS bangalore_city_avg,
    CASE WHEN city.city = 'San Jose' THEN city.avg_temp END AS sanjose_city_avg 
  FROM 
  global_data AS global
  JOIN
  (
	SELECT *
	FROM city_data 
	WHERE
	city IN ('Bangalore', 'San Jose')
  ) AS city
  ON global.year = city.year 
) AS temp
GROUP BY year
ORDER BY year
