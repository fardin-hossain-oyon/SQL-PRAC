WITH cte AS
(
    SELECT Customer.CompanyName, Product.Name, Product.ProductModelID
    FROM Product
    JOIN SalesOrderDetail ON Product.ProductID = SalesOrderDetail.ProductID
    JOIN SalesOrderHeader ON SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesOrderID
    JOIN Customer ON SalesOrderHeader.CustomerID = Customer.CustomerID
)
SELECT cte.Name, cte.CompanyName
FROM cte
JOIN ProductModel ON cte.ProductModelID = ProductModel.ProductModelID
WHERE ProductModel.name = 'Racing Socks'