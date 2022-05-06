-- ${1:productfeatureproduct.productfeature:percent}
-- ${2:productfeatureproduct.productfeature:percent}
-- ${3:productfeatureproduct.productfeature:percent}

SELECT DISTINCT v9."label8m9" AS "label8m9", v9."product1m8" AS "product1m8", v9."propertytex11m10" AS "propertytex11m10"
FROM (SELECT v1."label" AS "label8m9", v1."nr" AS "product1m8", v1."propertytex1" AS "propertytex11m10"
FROM "product" v1, "productfeatureproduct" v2, "productfeatureproduct" v3
WHERE (v1."label" IS NOT NULL AND v1."propertytex1" IS NOT NULL AND v1."propertynum1" IS NOT NULL AND v1."nr" = v2."product" AND v1."nr" = v3."product" AND ${1:productfeatureproduct.productfeature:percent} = v2."productfeature" AND ${2:productfeatureproduct.productfeature:percent} = v3."productfeature")
UNION ALL 
SELECT v5."label" AS "label8m9", v5."nr" AS "product1m8", v5."propertytex1" AS "propertytex11m10"
FROM "product" v5, "productfeatureproduct" v6, "productfeatureproduct" v7
WHERE (v5."label" IS NOT NULL AND v5."propertytex1" IS NOT NULL AND v5."propertynum2" IS NOT NULL AND v5."nr" = v6."product" AND v5."nr" = v7."product" AND ${1:productfeatureproduct.productfeature:percent} = v6."productfeature" AND ${3:productfeatureproduct.productfeature:percent} = v7."productfeature")
) v9
