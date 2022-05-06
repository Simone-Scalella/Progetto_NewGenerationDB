-- ${1:productfeatureproduct.productfeature:none}
-- ${2:productfeatureproduct.productfeature:none}

SELECT v1."label" AS "label8m46", v1."nr" AS "product1m2"
FROM "product" v1
 JOIN 
"productfeatureproduct" v2 ON (v1."label" IS NOT NULL AND v1."propertynum1" IS NOT NULL AND v1."propertynum3" IS NOT NULL AND v1."nr" = v2."product" AND ${1:productfeatureproduct.productfeature:none} = v2."productfeature") 
 LEFT OUTER JOIN 
(SELECT v3."product" AS "product1m0", 'ontop-provenance-constant' AS "v1"
FROM "productfeatureproduct" v3
WHERE ${2:productfeatureproduct.productfeature:none} = v3."productfeature"
) v5 ON (v1."label" IS NOT NULL AND v1."nr" = v5."product1m0") 
WHERE (v5."v1" IS NULL OR v1."label" IS NULL)
