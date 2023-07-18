--CREATE OR REPLACE TABLE `hopeandvintage-389021.products.products-all` AS
SELECT DISTINCT
  AP.SKU,
  AP.ITEM,
  AP.PURCH_DT,
  AP.TAG_PRICE,
  AP.COST_DISC,
  ROUND(AP.TAG_PRICE * (1 - IFNULL(AP.COST_DISC, 0)), 2) AS COST,
  AP.BRAND,
  C.MAST_CAT,
  C.CAT,
  C.TYP,
  AP.SUBTYP,
  AP.DAMAGED,
  AP.KEPT,
  AP.DONATED
FROM
  `hopeandvintage-389021.raw_exports.products-import` AP
LEFT JOIN 
  `hopeandvintage-389021.products.categories` C
ON
  AP.SUBTYP = C.SUBTYP
ORDER BY
  AP.PURCH_DT ASC,
  AP.ITEM ASC,
  COST DESC
