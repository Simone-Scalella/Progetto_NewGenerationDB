-- ${1:product.nr:percent}

SELECT v12."productfeature" AS "Feature", AVG(v12."propertynum1") AS "mean"
FROM(
        SELECT v1."propertynum1",v2."productfeature"
        FROM "product1" v1, "productfeatureproduct1" v2, "productfeature" v3
        WHERE (
            (v3."nr" >= 5000) AND
            (v2."product" <= 15000) AND
            v1."label" IS NOT NULL AND
            v1."propertynum1" IS NOT NULL AND
            v1."nr" = v2."product" AND
            v2."productfeature" = v3."nr"
            )

    UNION ALL

        SELECT v4."propertynum1", v5."productfeature"
        FROM "product2" v4, "productfeatureproduct2" v5, "productfeature" v6
        WHERE (
            (v6."nr" >= 5000) AND
            (v5."product" <= 15000) AND
            v4."label" IS NOT NULL AND
            v4."propertynum1" IS NOT NULL AND
            v4."nr" = v5."product" AND
            v5."productfeature" = v6."nr"
            )
        ) as v12
GROUP BY v12."productfeature"

    
