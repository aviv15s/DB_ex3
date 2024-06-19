-- authors (name, conference, year, institution, count, adjustedcount)
-- conferences (conference, area, subarea)
-- institutions (institution, region, country

WITH tempTable (name, year, totalCount) AS
(
    SELECT name, year, SUM(count)
    FROM conferences JOIN authors ON conferences.conference = authors.conference
    WHERE area = "ai" AND institution = "Hebrew University of Jerusalem"
    GROUP BY name, year
)
SELECT year, name
FROM tempTable
WHERE totalCount >= ALL (
    SELECT T.totalCount
    FROM tempTable T
    WHERE T.year = tempTable.year
)
ORDER BY year ASC, name ASC;