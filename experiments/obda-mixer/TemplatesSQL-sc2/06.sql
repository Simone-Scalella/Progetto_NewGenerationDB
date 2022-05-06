-- ${1:product.label:none}

SELECT v24."label10m46" AS "label10m46", v24."nr13m4" AS "nr13m4", v24."nr1m2" AS "nr1m2", v24."nr8m3" AS "nr8m3", v24."v0" AS "v0"
FROM (SELECT v18."label10m46" AS "label10m46", CAST(NULL AS INTEGER) AS "nr13m4", v18."nr1m2" AS "nr1m2", CAST(NULL AS INTEGER) AS "nr8m3", 0 AS "v0"
      FROM (SELECT DISTINCT v5."label10m46" AS "label10m46", v5."nr1m2" AS "nr1m2"
            FROM (SELECT v1."label" AS "label10m46", v1."nr" AS "nr1m2"
                  FROM "product1" v1
                  WHERE (v1."label" IS NOT NULL AND (POSITION('${1:product.label:none}' IN v1."label") > 0))
                  UNION ALL
                  SELECT v3."label" AS "label10m46", v3."nr" AS "nr1m2"
                  FROM "product2" v3
                  WHERE (v3."label" IS NOT NULL AND (POSITION('${1:product.label:none}' IN v3."label") > 0))
                 ) v5, (SELECT v6."nr" AS "nr1m0"
                        FROM "product1" v6
                        UNION ALL
                        SELECT v8."nr" AS "nr1m0"
                        FROM "product2" v8
                        UNION ALL
                        SELECT v10."product" AS "nr1m0"
                        FROM "review" v10
                        WHERE v10."product" IS NOT NULL
                        UNION ALL
                        SELECT v12."product" AS "nr1m0"
                        FROM "reviewc" v12
                        WHERE v12."product" IS NOT NULL
                        UNION ALL
                        SELECT v14."product" AS "nr1m0"
                        FROM "offer" v14
                        WHERE v14."product" IS NOT NULL
                 ) v16
            WHERE v5."nr1m2" = v16."nr1m0"
           ) v18
      UNION ALL
      SELECT v20."label" AS "label10m46", CAST(NULL AS INTEGER) AS "nr13m4", CAST(NULL AS INTEGER) AS "nr1m2", v20."nr" AS "nr8m3", 1 AS "v0"
      FROM "productfeature" v20
      WHERE ((POSITION('${1:product.label:none}' IN v20."label") > 0) AND v20."label" IS NOT NULL AND v20."publisher" IS NOT NULL)
      UNION ALL
      SELECT v22."label" AS "label10m46", v22."nr" AS "nr13m4", CAST(NULL AS INTEGER) AS "nr1m2", CAST(NULL AS INTEGER) AS "nr8m3", 2 AS "v0"
      FROM "producttype" v22
      WHERE ((POSITION('${1:product.label:none}' IN v22."label") > 0) AND v22."label" IS NOT NULL AND v22."publisher" IS NOT NULL)
     ) v24
