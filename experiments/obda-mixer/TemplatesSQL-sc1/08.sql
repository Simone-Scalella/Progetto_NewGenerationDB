-- ${1:review.product:percent}

SELECT v2."name" AS "name1m12", v1."person" AS "person1m7", v1."rating1" AS "rating11m16", v1."rating2" AS "rating21m17", v1."rating3" AS "rating31m13", v1."rating4" AS "rating41m15", v1."text" AS "text1m14", v1."title" AS "title1m11", TO_JSON(v1."reviewdate")#>>'{}' AS "v0"
FROM "review" v1, "person" v2
WHERE (v1."title" IS NOT NULL AND v1."text" IS NOT NULL AND v1."reviewdate" IS NOT NULL AND v2."name" IS NOT NULL AND v1."person" = v2."nr" AND ${1:review.product:percent} = v1."product")
