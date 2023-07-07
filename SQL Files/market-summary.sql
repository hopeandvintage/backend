SELECT 
  ORDR_MTH,
  CUSTOMER,
  COUNT(CUSTOMER) AS CUSTOMERS,
  SUM(ITEM_CNT) AS ITEMS,
  ROUND(SUM(ITEM_CNT) / COUNT(CUSTOMER),2) AS ITEM_PER_CUST,
  ROUND(SUM(SUBTOT),2) AS PRICE,
  ROUND(SUM(COST),2) AS COST,
  ROUND(SUM(SUBTOT) - SUM(COST),2) AS PROFIT
FROM
  `hopeandvintage-389021.orders.orders-junjul23`
GROUP BY
  ORDR_MTH,
  CUSTOMER
