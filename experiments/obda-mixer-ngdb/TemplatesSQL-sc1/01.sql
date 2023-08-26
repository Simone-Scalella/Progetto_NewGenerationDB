-- ${1:productfeatureproduct.productfeature:percent}
-- ${2:productfeatureproduct.productfeature:percent}
-- ${1:product.propertynum1:none}

SELECT v2."product" AS "Prodotti", AVG(v1."propertynum1") AS "mean"
FROM "product" v1, "productfeatureproduct" v2, "productfeature" v3
WHERE (
        (v3."nr" >= 5000) AND
        (v2."product" <= 15000) AND
         v1."label" IS NOT NULL AND
          v1."propertynum1" IS NOT NULL AND
        v1."nr" = v2."product" AND
         v2."productfeature" = v3."nr"
        )
GROUP BY v2."product"

