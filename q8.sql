-- authors (name, conference, year, institution, count, adjustedcount)
-- conferences (conference, area, subarea)
-- institutions (institution, region, country

SELECT DISTINCT name
FROM (
    SELECT DISTINCT A.name
    FROM authors A JOIN conferences ON A.conference = conferences.conference
    WHERE subarea = "ml" AND year >= 2020
) recent
INTERSECT
(
    SELECT DISTINCT A.name
    FROM authors A JOIN conferences ON A.conference = conferences.conference
    WHERE subarea = "ml"
    GROUP BY A.name
    HAVING COUNT(*) >= 3
);