-- authors (name, conference, year, institution, count, adjustedcount)
-- conferences (conference, area, subarea)
-- institutions (institution, region, country

SELECT DISTINCT institution, name
FROM authors JOIN institutions ON institutions.institution = authors.institution
WHERE region = "africa"
ORDER BY institution ASC, name ASC;