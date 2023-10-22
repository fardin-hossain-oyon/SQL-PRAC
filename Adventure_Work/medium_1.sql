SELECT sod.SalesOrderID, sod.UnitPrice
FROM SalesOrderHeader soh
JOIN SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
WHERE sod.OrderQty = 1