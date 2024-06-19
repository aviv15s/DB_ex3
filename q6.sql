-- authors (name, conference, year, institution, count, adjustedcount)
-- conferences (conference, area, subarea)
-- institutions (institution, region, country

SELECT DISTINCT name
FROM authors
WHERE NOT EXISTS (
    SELECT A.conference
    FROM authors A
    WHERE A.name = "Omri Abend" AND NOT EXISTS (
        SELECT *
        FROM authors B
        WHERE B.name = authors.name AND B.year = A.year AND B.conference = A.conference
    )
)
ORDER BY name ASC;