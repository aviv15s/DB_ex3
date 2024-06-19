-- authors (name, conference, year, institution, count, adjustedcount)
-- conferences (conference, area, subarea)
-- institutions (institution, region, country

-- SELECT name, year
-- FROM authors A 
-- JOIN authors B ON A.year = B.year AND A.name = B.name
-- JOIN conferences C ON C.conference = A.conference
-- JOIN conferences D ON D.conference = B.conference
-- WHERE A.institution = "Hebrew University of Jerusalem" AND 
-- C.subarea = "ai" AND
-- D.subarea = "economics"
-- ORDER BY name ASC, year ASC;


SELECT DISTINCT name, year
FROM (
    SELECT name, year
    FROM authors JOIN conferences ON authors.conference = conferences.conference
    WHERE subarea = "ai" AND institution = "Hebrew University of Jerusalem"
) ai JOIN
(
    SELECT name, year
    FROM authors JOIN conferences ON authors.conference = conferences.conference
    WHERE subarea = "economics" AND institution = "Hebrew University of Jerusalem"
) economics ON ai.name = economics.name AND ai.year = economics.year
ORDER BY name ASC, year ASC;