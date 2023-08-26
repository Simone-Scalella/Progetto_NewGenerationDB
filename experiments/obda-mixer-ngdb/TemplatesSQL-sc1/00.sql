-- ${1:product.nr:percent}

SELECT v1."product" AS "nr1m23", COUNT(*) AS "v1"
FROM "productfeatureproduct" v1
WHERE (v1."product" <= 10000)
GROUP BY v1."product"
