-- ${1:review.nr:percent}

SELECT v3."country" AS "country3m1", v3."mbox_sha1sum" AS "mbox_sha1sum1m47", v1."nr" AS "nr1m4", v1."person" AS "person1m7", v1."product" AS "product1m4", v1."title" AS "title1m11"
FROM "review" v1, "review" v2, "person" v3
WHERE (v3."name" IS NOT NULL AND v3."mbox_sha1sum" IS NOT NULL AND v3."country" IS NOT NULL AND v1."product" IS NOT NULL AND v1."title" IS NOT NULL AND v1."person" = v2."person" AND v1."person" = v3."nr" AND ${1:review.nr:percent} = v2."nr")
