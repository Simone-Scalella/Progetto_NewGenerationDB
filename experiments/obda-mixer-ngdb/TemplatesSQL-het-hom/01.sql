-- ${1:product.nr:percent}

SELECT v12."propertynum1", AVG(v12."propertynum1") AS "mean"
FROM (
    SELECT v5."nr_product", v10."productfeature2m2", v5."propertynum1" AS "propertynum1"
    FROM (
        SELECT v1."nr" AS "nr_product"
        FROM "ss1"."product1" v1
        WHERE (v1."nr" <= ${1:product.nr:percent}) -- nostre condizioni
    UNION ALL
        SELECT v3."nr" AS "nr_product"
        FROM "ss5"."product2" v3
        WHERE (v3."nr" <= ${1:product.nr:percent}) -- nostre condizioni
    ) v5, 
    (
        SELECT v6."product" AS "product_pfp", v6."productfeature" AS "productfeature2m2"
        FROM "ss1"."productfeatureproduct1" v6
        WHERE (v6."product" <= ${1:product.nr:percent})
        UNION ALL
        SELECT v8."product" AS "product_pfp", v8."productfeature" AS "productfeature2m2"
        FROM "ss5"."productfeatureproduct2" v8
        WHERE (v8."product" <= ${1:product.nr:percent})
    ) v10,
    (
        SELECT v9."nr" AS "nr_productfeature"
        FROM "ss3"."productfeature" v9
    ) v11

    WHERE (
        v5."nr_product" = v10."product_pfp" AND
        v11."nr_productfeature" = v10."productfeature2m2"
    )

) v12
GROUP BY v12."propertynum1"
