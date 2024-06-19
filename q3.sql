-- authors (name, conference, year, institution, count, adjustedcount)
-- conferences (conference, area, subarea)
-- institutions (institution, region, country

SELECT DISTINCT institution, name
FROM authors JOIN institutions ON institutions.institution = authors.institution
WHERE country = "il" AND count > 2 AND conference LIKE "sig%"
ORDER BY institution ASC, name ASC;