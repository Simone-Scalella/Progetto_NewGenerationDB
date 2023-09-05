-- ${1:productfeatureproduct.productfeature:none}
-- ${2:productfeatureproduct.productfeature:none}

SELECT v1."comment" AS "comment8m20", v4."label" AS "label8m16", v2."label" AS "label8m4", v1."label" AS "label8m46", v1."propertynum1" AS "propertynum11m41", v1."propertynum2" AS "propertynum21m40", v1."propertynum4" AS "propertynum41m25", v1."propertytex1" AS "propertytex11m34", v1."propertytex2" AS "propertytex21m33", v1."propertytex3" AS "propertytex31m32", v1."propertytex4" AS "propertytex41m31", v1."propertytex5" AS "propertytex51m30"
FROM "product" v1, "producer" v2, "productfeatureproduct" v3, "productfeature" v4
WHERE ((v1."nr" <= 15000) AND v1."label" IS NOT NULL AND v1."comment" IS NOT NULL AND v2."label" IS NOT NULL AND v4."label" IS NOT NULL AND v1."propertytex1" IS NOT NULL AND v1."propertytex2" IS NOT NULL AND v1."propertytex3" IS NOT NULL AND v1."propertynum1" IS NOT NULL AND v1."propertynum2" IS NOT NULL AND v1."producer" = v2."nr" AND v1."nr" = v3."product" AND v3."productfeature" = v4."nr")
