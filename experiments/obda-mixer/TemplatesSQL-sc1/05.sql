-- ${1:product.nr:percent}

SELECT v1."label" AS "label8m46", v1."nr" AS "product1m4"
FROM "product" v1, "product" v2, "productfeatureproduct" v3, "productfeatureproduct" v4
WHERE ((v1."propertynum2" < (v2."propertynum2" + 170)) AND (v1."propertynum1" < (v2."propertynum1" + 120)) AND v1."nr" <> ${1:product.nr:percent} AND v1."label" IS NOT NULL AND v2."propertynum1" IS NOT NULL AND v1."propertynum1" IS NOT NULL AND v2."propertynum2" IS NOT NULL AND v1."propertynum2" IS NOT NULL AND v1."nr" = v4."product" AND v3."productfeature" = v4."productfeature" AND ${1:product.nr:percent} = v2."nr" AND ${1:product.nr:percent} = v3."product")
