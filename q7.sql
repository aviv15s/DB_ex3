-- authors (name, conference, year, institution, count, adjustedcount)
-- conferences (conference, area, subarea)
-- institutions (institution, region, country

SELECT country, COUNT(institution) AS institutionCount
FROM institutions
GROUP BY country
ORDER BY country ASC;