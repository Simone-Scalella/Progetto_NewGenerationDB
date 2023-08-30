
SELECT vf."homepage" AS "Homepage", MAX(vf."price") AS "Massimo prezzo"
FROM (
     "producer" v1 join
    (
        SELECT p1."producer", p1."nr"
        FROM "product1" p1
    UNION ALL
        SELECT p2."producer", p2."nr"
        FROM "product2" p2

    ) v2 ON v1."nr" = v2."producer"
    join "offer" v3 ON v2."nr" = v3."product"
    ) vf
GROUP BY(vf."homepage")