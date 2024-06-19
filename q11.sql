-- authors (name, conference, year, institution, count, adjustedcount)
-- conferences (conference, area, subarea)
-- institutions (institution, region, country

WITH tempTable (conference) AS
(
    SELECT conference
    FROM conferences JOIN authors ON conferences.conference = authors.conference
    WHERE COUNT(DISTINCT year) > 15
    GROUP BY conference
)
SELECT name
FROM authors
WHERE NOT EXISTS (
    SELECT *
    FROM authors A
    WHERE A.name = name AND A.conference IN (tempTable)
)
ORDER BY name ASC;