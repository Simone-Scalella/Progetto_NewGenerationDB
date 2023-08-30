
SELECT vf."homepage" AS "Homepage", MAX(vf."price") AS "Massimo"
    FROM (SELECT v5."homepage", v7."price"
        FROM (
            SELECT v3."nr" AS "nr_pro", v3."homepage"
                FROM "ss4"."producer" v3

            ) v5,

            (
        SELECT p1."producer", p1."nr"
        FROM "ss1"."product1" p1
    UNION ALL
        SELECT p2."producer", p2."nr"
        FROM "ss5"."product2" p2

    ) v6,
    (
            SELECT v2."product" , v2."price"
                FROM "ss4"."offer" v2

            ) v7

        WHERE 
            v5."nr_pro" = v6."producer"
) vf
GROUP BY vf."homepage"