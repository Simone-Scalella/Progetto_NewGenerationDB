-- ${1:product.nr:percent}

SELECT v12."nr2m23" AS "nr2m23", COUNT(*) AS "v1"
FROM (SELECT DISTINCT v5."nr2m23" AS "nr2m23", v10."productfeature2m2" AS "productfeature2m2"
FROM (
SELECT v3."nr" AS "nr2m23"
FROM "product2" v3
) v5, (
SELECT v8."product" AS "nr2m0", v8."productfeature" AS "productfeature2m2"
FROM "productfeatureproduct2" v8
) v10
WHERE v5."nr2m23" = v10."nr2m0"
) v12
GROUP BY v12."nr2m23"
