SELECT DISTINCT p1.cid AS cid1, p2.cid AS cid2
FROM Prerequisites p1, Prerequisites p2
WHERE NOT EXISTS (
    SELECT p.preid
    FROM Prerequisites p
    where p.cid = p1.cid AND p.preid NOT IN (
        SELECT p0.preid
        FROM Prerequisites p0
        WHERE p0.cid = p2.cid
    )
)
AND NOT EXISTS (
    SELECT p.preid
    FROM Prerequisites p
    where p.cid = p2.cid AND p.preid NOT IN (
        SELECT p0.preid
        FROM Prerequisites p0
        WHERE p0.cid = p1.cid
    )
)
AND p1.cid < p2.cid;