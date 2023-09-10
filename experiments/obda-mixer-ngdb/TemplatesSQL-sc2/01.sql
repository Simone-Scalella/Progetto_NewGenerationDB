-- 5000
-- 5000
-- ${1:product.propertynum1:none}

SELECT DISTINCT v5."label10m46" AS "label10m46", v5."product0m2" AS "product0m2"
FROM (SELECT v1."label" AS "label10m46", v1."nr" AS "product0m2"
FROM "product1" v1
WHERE v1."label" IS NOT NULL
UNION ALL 
SELECT v3."label" AS "label10m46", v3."nr" AS "product0m2"
FROM "product2" v3
WHERE v3."label" IS NOT NULL
) v5, (SELECT v6."product" AS "product0m0"
FROM "productfeatureproduct1" v6
WHERE 5000 = v6."productfeature"
UNION ALL 
SELECT v8."product" AS "product0m0"
FROM "productfeatureproduct2" v8
WHERE 5000 = v8."productfeature"
) v10, (SELECT v11."product" AS "product0m1"
FROM "productfeatureproduct1" v11
WHERE 5000 = v11."productfeature"
UNION ALL 
SELECT v13."product" AS "product0m1"
FROM "productfeatureproduct2" v13
WHERE 5000 = v13."productfeature"
) v15, (SELECT v16."nr" AS "product0m3", v16."propertynum1" AS "propertynum1m41"
FROM "product1" v16
WHERE (v16."propertynum1" IS NOT NULL AND (v16."propertynum1" <= ${1:product.propertynum1:none}))
UNION ALL 
SELECT v18."nr" AS "product0m3", v18."propertynum1" AS "propertynum1m41"
FROM "product2" v18
WHERE (v18."propertynum1" IS NOT NULL AND (v18."propertynum1" <= ${1:product.propertynum1:none}))
) v20
WHERE (v5."product0m2" = v10."product0m0" AND v5."product0m2" = v15."product0m1" AND v5."product0m2" = v20."product0m3")
