-- 5000
-- 5000
-- ${1:product.propertynum1:none}

SELECT v1."label" AS "label8m46", v1."nr" AS "product1m2"
FROM "product" v1, "productfeatureproduct" v2, "productfeatureproduct" v3
WHERE ((v1."propertynum1" <= ${1:product.propertynum1:none}) AND v1."label" IS NOT NULL AND v1."propertynum1" IS NOT NULL AND
        v1."nr" = v2."product" AND v1."nr" = v3."product" AND
        5000 = v2."productfeature" AND
        5000 = v3."productfeature")
