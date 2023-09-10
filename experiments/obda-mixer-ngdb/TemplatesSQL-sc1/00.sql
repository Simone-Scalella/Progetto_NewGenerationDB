-- 2000

SELECT v1."product" AS "nr1m23", COUNT(*) AS "v1"
FROM "productfeatureproduct" v1
WHERE (v1."product" <= 2000)
GROUP BY v1."product"
