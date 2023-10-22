SELECT Customer.Company_name, sales_product.subtotal, sales_product.total_weight
FROM 
(
SELECT SalesOrderHeader.CustomerID, SalesOrderHeader.Subtotal, (SalesOrderDetail.OrderQty * Product.Weight) AS total_weight, SalesOrderHeader.SubTotal
FROM SalesOrderDetail
JOIN SalesOrderHeader ON SalesOrderDetail.SalesOrderID = SalesOrderHeader.SaledOrderID
JOIN Product ON Product.ProductID = SalesOrderDetail.ProductID
) sales_product,
Customer
WHERE sales_product.CustomerID = Customer.CustomerID