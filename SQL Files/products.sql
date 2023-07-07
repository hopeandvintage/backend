--CREATE OR REPLACE TABLE `hopeandvintage-389021.products.products-all` AS
SELECT DISTINCT
  --ROW_NUMBER() OVER (ORDER BY AP.PURCH_DT ASC, AP.ITEM ASC, AP.COST DESC) AS PROD_ID,
  ----*removed this prod_id in favor of using SKU as a unique product identifier (7-7)*
  -- CASE
  --   WHEN C.MAST_CAT = 'Clothing' THEN 'C' || ROW_NUMBER() OVER (PARTITION BY C.MAST_CAT ORDER BY AP.PURCH_DT ASC, AP.ITEM ASC, AP.COST DESC)
  --   WHEN C.MAST_CAT = 'Decor' THEN 'D' || ROW_NUMBER() OVER (PARTITION BY C.MAST_CAT ORDER BY AP.PURCH_DT ASC, AP.ITEM ASC, AP.COST DESC)
  --   WHEN C.MAST_CAT = 'Other' THEN 'O' || ROW_NUMBER() OVER (PARTITION BY C.MAST_CAT ORDER BY AP.PURCH_DT ASC, AP.ITEM ASC, AP.COST DESC)
  -- END AS SKU,
  ----*removed this method of creating SKU because it can't start from last used SKU (7-7)*
  AP.SKU,
  AP.ITEM,
  AP.PURCH_DT,
  AP.COST,
  --AP.PRICE,
  ----*removed to avoid confusion as column is only used in spreadsheet for pricing(7-7)*
  AP.BRAND,
  C.MAST_CAT,
  C.CAT,
  C.TYP,
  AP.SUBTYP,
  --AP.LOC,
  ----*no longer using this column to track inventory (7-7)*
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
  AP.COST DESC
