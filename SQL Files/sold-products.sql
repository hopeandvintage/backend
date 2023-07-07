--CREATE OR REPLACE TABLE `hopeandvintage-389021.Orders.Sold Products` AS
WITH ORDR AS (
  SELECT
    SE.MER_ORDR_ID AS ORDR_ID,
    DATE(DATE_TRUNC(SE.PROD_ORDR_TMS, month)) AS PROD_ORDR_MTH,
    SE.PROD_ORDR_TMS,
    SE.SKU,
    SE.ITEM,
    SE.QTY,
    SE.PRICE
  FROM
    `hopeandvintage-389021.raw_exports.orders-shopify-junjul23` SE
  ORDER BY
    SE.MER_ORDR_ID ASC
  ),
PROD AS (
  SELECT
    PA.SKU,
    PA.PURCH_DT,
    PA.COST,
    PA.BRAND,
    PA.MAST_CAT,
    PA.CAT,
    PA.TYP,
    PA.SUBTYP
  FROM
    `hopeandvintage-389021.products.products-all` PA
  )
SELECT
  O.ORDR_ID,
  O.PROD_ORDR_MTH,
  O.PROD_ORDR_TMS,
  O.ITEM,
  O.SKU,  
  O.QTY,
  O.PRICE,
  P.PURCH_DT,
  P.COST,
  P.BRAND,
  P.MAST_CAT,
  P.CAT,
  P.TYP,
  P.SUBTYP
FROM
  ORDR O
LEFT JOIN
  PROD P
ON
  O.SKU = P.SKU
