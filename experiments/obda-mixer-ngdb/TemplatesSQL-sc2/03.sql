-- 125
-- CN

SELECT DISTINCT v9."nr1m5" AS "nr1m5", v9."product1m5" AS "product1m5"
FROM (SELECT v2."deliverydays" AS "deliverydays1m37", v2."nr" AS "nr1m5", v2."price" AS "price1m39", v1."nr" AS "product1m5", v2."validto" AS "validto1m45"
FROM "product1" v1, "offer" v2, "vendor" v3
WHERE ((v2."deliverydays" <= 3) AND (v1."nr" <= 125) AND v2."deliverydays" IS NOT NULL AND v2."price" IS NOT NULL AND v2."validto" IS NOT NULL AND v1."nr" = v2."product" AND v2."vendor" = v3."nr" AND v3."comment" LIKE '%oo%' AND 'CN' = v3."country")
UNION ALL 
SELECT v6."deliverydays" AS "deliverydays1m37", v6."nr" AS "nr1m5", v6."price" AS "price1m39", v5."nr" AS "product1m5", v6."validto" AS "validto1m45"
FROM "product2" v5, "offer" v6, "vendor" v7
WHERE ((v6."deliverydays" <= 3) AND (v5."nr" <= 125) AND v6."deliverydays" IS NOT NULL AND v6."price" IS NOT NULL AND v6."validto" IS NOT NULL AND v5."nr" = v6."product" AND v6."vendor" = v7."nr" AND v7."comment" LIKE '%oo%' AND 'CN' = v7."country")
) v9
