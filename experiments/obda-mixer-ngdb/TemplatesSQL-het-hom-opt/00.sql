-- ${1:product.nr:percent}

SELECT v12."nr2m23" AS "nr2m23", COUNT(*) AS "v1"
FROM (
	  SELECT DISTINCT v3."nr" AS "nr2m23", v8."productfeature" AS "productfeature2m2"
	  FROM "ss5"."product2" v3, "ss5"."productfeatureproduct2" v8
	  WHERE v3."nr"=v8."product"
    ) v12
GROUP BY v12."nr2m23"
