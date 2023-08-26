-- ${1:product.nr:percent}

SELECT v12."productfeature" AS "Feature", AVG(v12."propertynum1") AS "mean"
FROM (
    SELECT DISTINCT v5."nr_product" AS "nr_product", v10."productfeature" AS "productfeature", v5."propertynum1" AS "propertynum1", v10."product"
    FROM (
        SELECT v1."nr" AS "nr_product", v1."propertynum1" AS "propertynum1"
        FROM "ss1"."product1" v1
        WHERE (
            v1."label" IS NOT NULL AND
            v1."propertynum1" IS NOT NULL
        )
        UNION ALL
        SELECT v3."nr" AS "nr_product", v3."propertynum1" AS "propertynum1"
        FROM "ss5"."product2" v3
        WHERE (
            v3."label" IS NOT NULL AND
            v3."propertynum1" IS NOT NULL
        )
    ) v5, 
    (
        SELECT v6."product" AS "product", v6."productfeature" AS "productfeature"
        FROM "ss1"."productfeatureproduct1" v6
        WHERE (v6."product" <= 15000)
        UNION ALL
        SELECT v8."product" AS "product", v8."productfeature" AS "productfeature"
        FROM "ss5"."productfeatureproduct2" v8
        WHERE (v8."product" <= 15000)
    ) v10,
    (
        SELECT v9."nr" as "nr_pf"
        FROM "ss3"."productfeature" v9
        WHERE (
            v9."nr" >= 5000
        )
    ) v11

    WHERE (
        v5."nr_product" = v10."product" AND
        v11."nr_pf" = v10."productfeature"
    )
) v12
GROUP BY v12."productfeature"

--
