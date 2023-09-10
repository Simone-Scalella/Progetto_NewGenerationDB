-- 2000

SELECT v12."nr2m23" AS "nr2m23", COUNT(*) AS "v1"
FROM (
	  SELECT DISTINCT v1."nr" AS "nr2m23", v6."productfeature" AS "productfeature2m2"
	  FROM "ss1"."product1" v1, "ss1"."productfeatureproduct1" v6
	  WHERE v1."nr" <= 2000 AND v1."nr"=v6."product"
	  UNION ALL
	  SELECT DISTINCT v3."nr" AS "nr2m23", v8."productfeature" AS "productfeature2m2"
	  FROM "ss5"."product2" v3, "ss5"."productfeatureproduct2" v8
	  WHERE v3."nr" <= 2000 AND v3."nr"=v8."product"
    ) v12
GROUP BY v12."nr2m23"
