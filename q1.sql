-- authors (name, conference, year, institution, count, adjustedcount)
-- conferences (conference, area, subarea)
-- institutions (institution, region, country

SELECT institution
FROM institutions
WHERE country = "il"
ORDER BY institution ASC;