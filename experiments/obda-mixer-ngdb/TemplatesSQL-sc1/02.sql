-- ${1:offer.nr:percent}

SELECT v25."v26" AS "v26", v25."v6" AS "v6", v25."v9" AS "v9"
FROM (SELECT 'http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/vocabulary/Offer' AS "v26", 0 AS "v6", 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type' AS "v9"
FROM "offer" v1
WHERE  v1."deliverydays" % 3 = 0 AND v1."nr" <= 200000
UNION ALL 
SELECT 'http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/vocabulary/Product' AS "v26", 0 AS "v6", 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type' AS "v9"
FROM "offer" v3
WHERE (v3."vendor" IS NOT NULL AND  v3."deliverydays" % 3 = 0 AND v3."nr" <= 200000)
UNION ALL 
SELECT ('http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/instances/dataFromProducer/Product' || CAST(v5."product" AS TEXT)) AS "v26", 0 AS "v6", 'http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/vocabulary/product' AS "v9"
FROM "offer" v5
WHERE (v5."product" IS NOT NULL AND  v5."deliverydays" % 3 = 0 AND v5."nr" <= 200000)
UNION ALL 
SELECT ('http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/instances/dataFromVendor/Vendor' || CAST(v7."vendor" AS TEXT)) AS "v26", 0 AS "v6", 'http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/vocabulary/vendor' AS "v9"
FROM "offer" v7
WHERE (v7."vendor" IS NOT NULL AND  v7."deliverydays" % 3 = 0 AND v7."nr" <= 200000)
UNION ALL 
SELECT ('http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/instances/dataFromVendor/Vendor' || CAST(v9."vendor" AS TEXT)) AS "v26", 0 AS "v6", 'http://purl.org/dc/elements/1.1/publisher' AS "v9"
FROM "offer" v9
WHERE (v9."vendor" IS NOT NULL AND  v9."deliverydays" % 3 = 0 AND v9."nr" <= 200000)
UNION ALL 
SELECT '${1:offer.nr:percent}' AS "v26", 1 AS "v6", 'http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/vocabulary/offerId' AS "v9"
FROM "offer" v11
WHERE v11."deliverydays" % 3 = 0 AND v11."nr" <= 200000
UNION ALL 
SELECT CAST(v13."publishdate" AS TEXT) AS "v26", 2 AS "v6", 'http://purl.org/dc/elements/1.1/date' AS "v9"
FROM "offer" v13
WHERE (v13."publishdate" IS NOT NULL AND v13."deliverydays" % 3 = 0 AND v13."nr" <= 200000)
UNION ALL 
SELECT v15."offerwebpage" AS "v26", 3 AS "v6", 'http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/vocabulary/offerWebpage' AS "v9"
FROM "offer" v15
WHERE (v15."offerwebpage" IS NOT NULL AND v15."deliverydays" % 3 = 0 AND v15."nr" <= 200000)
UNION ALL 
SELECT CAST(v17."deliverydays" AS TEXT) AS "v26", 1 AS "v6", 'http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/vocabulary/deliveryDays' AS "v9"
FROM "offer" v17
WHERE (v17."deliverydays" IS NOT NULL AND v17."deliverydays" % 3 = 0 AND v17."nr" <= 200000)
UNION ALL 
SELECT CAST(v19."price" AS TEXT) AS "v26", 4 AS "v6", 'http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/vocabulary/price' AS "v9"
FROM "offer" v19
WHERE (v19."price" IS NOT NULL AND v19."deliverydays" % 3 = 0 AND v19."nr" <= 200000)
UNION ALL 
SELECT TO_JSON(v21."validfrom")#>>'{}' AS "v26", 5 AS "v6", 'http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/vocabulary/validFrom' AS "v9"
FROM "offer" v21
WHERE (v21."validfrom" IS NOT NULL AND v21."deliverydays" % 3 = 0 AND v21."nr" <= 200000)
UNION ALL 
SELECT TO_JSON(v23."validto")#>>'{}' AS "v26", 5 AS "v6", 'http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/vocabulary/validTo' AS "v9"
FROM "offer" v23
WHERE (v23."validto" IS NOT NULL AND v23."deliverydays" % 3 = 0 AND v23."nr" <= 200000)
) v25

