-- ${1:product.label:none}

SELECT v17."label8m46" AS "label8m46", v17."nr1m1" AS "nr1m1", v17."nr3m2" AS "nr3m2", v17."nr8m3" AS "nr8m3", v17."v0" AS "v0"
FROM (SELECT v11."label8m46" AS "label8m46", v11."nr1m1" AS "nr1m1", CAST(NULL AS INTEGER) AS "nr3m2", CAST(NULL AS INTEGER) AS "nr8m3", 0 AS "v0"
      FROM (SELECT DISTINCT v9."label8m46" AS "label8m46", v9."nr1m1" AS "nr1m1"
            FROM (SELECT v1."label" AS "label8m46", v1."nr" AS "nr1m1"
                  FROM "product" v1
                  WHERE ((POSITION('${1:product.label:none}' IN v1."label") > 0) AND v1."label" IS NOT NULL)
                  UNION ALL
                  SELECT v4."label" AS "label8m46", v3."product" AS "nr1m1"
                  FROM "review" v3, "product" v4
                  WHERE ((POSITION('${1:product.label:none}' IN v4."label") > 0) AND v4."label" IS NOT NULL AND v3."product" = v4."nr")
                  UNION ALL
                  SELECT v7."label" AS "label8m46", v6."product" AS "nr1m1"
                  FROM "offer" v6, "product" v7
                  WHERE ((POSITION('${1:product.label:none}' IN v7."label") > 0) AND v7."label" IS NOT NULL AND v6."product" = v7."nr")
                 ) v9
           ) v11
      UNION ALL
      SELECT v13."label" AS "label8m46", CAST(NULL AS INTEGER) AS "nr1m1", v13."nr" AS "nr3m2", CAST(NULL AS INTEGER) AS "nr8m3", 1 AS "v0"
      FROM "productfeature" v13
      WHERE ((POSITION('${1:product.label:none}' IN v13."label") > 0) AND v13."label" IS NOT NULL AND v13."publisher" IS NOT NULL)
      UNION ALL
      SELECT v15."label" AS "label8m46", CAST(NULL AS INTEGER) AS "nr1m1", CAST(NULL AS INTEGER) AS "nr3m2", v15."nr" AS "nr8m3", 2 AS "v0"
      FROM "producttype" v15
      WHERE ((POSITION('${1:product.label:none}' IN v15."label") > 0) AND v15."label" IS NOT NULL AND v15."publisher" IS NOT NULL)
     ) v17
