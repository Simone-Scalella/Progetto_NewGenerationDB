-- 1000

SELECT v1."deliverydays" AS "deliverydays1m37", v3."label" AS "label8m4", v2."label" AS "label8m46", v1."nr" AS "nr1m21", v1."offerwebpage" AS "offerwebpage1m24", v1."price" AS "price1m39", v1."product" AS "product1m5", TO_JSON(v1."validto")#>>'{}' AS "v0", v1."vendor" AS "vendor1m8"
FROM "offer" v1, "product" v2, "vendor" v3
WHERE ((v1."nr" <= 1000) AND v2."label" IS NOT NULL AND v3."label" IS NOT NULL AND v3."homepage" IS NOT NULL AND v1."offerwebpage" IS NOT NULL AND v1."price" IS NOT NULL AND v1."deliverydays" IS NOT NULL AND v1."validto" IS NOT NULL AND v1."product" = v2."nr" AND v1."vendor" = v3."nr")
