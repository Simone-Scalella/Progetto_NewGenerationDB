-- ${1:productfeatureproduct.productfeature:percent}
-- ${2:productfeatureproduct.productfeature:percent}
-- 2000

SELECT v1."label" AS "label8m46", v1."nr" AS "product1m2"
FROM "product" v1, "productfeatureproduct" v2, "productfeatureproduct" v3
WHERE ((v1."propertynum1" <= 2000) AND v1."label" IS NOT NULL AND v1."propertynum1" IS NOT NULL AND
        v1."nr" = v2."product" AND v1."nr" = v3."product" AND
        ${1:productfeatureproduct.productfeature:percent} = v2."productfeature" AND
        ${2:productfeatureproduct.productfeature:percent} = v3."productfeature")
