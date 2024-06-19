-- authors (name, conference, year, institution, count, adjustedcount)
-- conferences (conference, area, subarea)
-- institutions (institution, region, country

SELECT name
FROM authors
WHERE NOT EXISTS (
    SELECT A.conference
    FROM authors A JOIN conferences ON A.conference = conferences.conference
    WHERE (area != "theory" OR year >= 1980) AND A.name = authors.name
)
ORDER BY name ASC;