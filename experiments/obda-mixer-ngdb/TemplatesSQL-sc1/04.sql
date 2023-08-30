
SELECT vf."homepage" AS "Homepage", MAX(vf."price") AS "Massimo prezzo"
FROM (
    "producer" v1 join "product" v2 ON v1."nr" = v2."producer"
    join "offer" v3 ON v2."nr" = v3."product"
    ) vf
GROUP BY(vf."homepage")