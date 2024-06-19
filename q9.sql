-- authors (name, conference, year, institution, count, adjustedcount)
-- conferences (conference, area, subarea)
-- institutions (institution, region, country

WITH tempTable (institution, country, totalCount) AS
(
    SELECT institution, country, SUM(count)
    FROM institutions JOIN authors ON institutions.institution = authors.institution
    GROUP BY institution, country
)
SELECT country, institution, totalCount AS countryCount
FROM tempTable
WHERE totalCount >= ALL (
    SELECT T.totalCount
    FROM tempTable T
    WHERE T.country = tempTable.country
)
ORDER BY country ASC, institution ASC;