-- ${1:product.nr:percent}
-- ${1:offer.validto:none}

SELECT v3."label" AS "label8m4", v1."label" AS "label8m46", v5."name" AS "name1m12", v4."nr" AS "nr1m4", v2."nr" AS "nr1m5", v4."person" AS "person1m7", v2."price" AS "price1m39", v4."rating1" AS "rating11m16", v4."rating2" AS "rating21m17", v4."title" AS "title1m11", v2."vendor" AS "vendor1m8"
FROM "product" v1
         LEFT OUTER JOIN
     "offer" v2
         JOIN
     "vendor" v3 ON ((v2."validto" > CAST('${1:offer.validto:none}' AS DATE)) AND v2."price" IS NOT NULL AND v3."label" IS NOT NULL AND v2."validto" IS NOT NULL AND v2."vendor" = v3."nr" AND ${1:product.nr:percent} = v2."product" AND 'DE' = v3."country")  ON 1 = 1
         LEFT OUTER JOIN
     "review" v4
         JOIN
     "person" v5 ON (v5."name" IS NOT NULL AND v4."title" IS NOT NULL AND v4."person" = v5."nr" AND ${1:product.nr:percent} = v4."product")  ON 1 = 1
WHERE (v1."label" IS NOT NULL AND ${1:product.nr:percent} = v1."nr")
