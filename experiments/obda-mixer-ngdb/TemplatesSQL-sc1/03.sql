-- ${49:vendor.label:percent}
-- ${1:vendor.country:none}

SELECT v1."nr" AS "nr1m5", v1."product" AS "product1m5"
FROM "offer" v1, "vendor" v2
WHERE (
    (v1."deliverydays" <= 3) AND
    (v1."product" <= 125) AND
     v1."deliverydays" IS NOT NULL AND
      v1."price" IS NOT NULL AND
       v1."validto" IS NOT NULL AND
        v1."product" IS NOT NULL AND
        v2."comment" LIKE '%oo%' AND
         v1."vendor" = v2."nr" AND
          'CN' = v2."country"
          )
