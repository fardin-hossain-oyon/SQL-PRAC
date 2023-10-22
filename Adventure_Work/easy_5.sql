SELECT Customer.CompanyName
FROM Product
JOIN SalesOrderDetail ON Product.ProductID = SalesOrderDetail.ProductID
JOIN SalesOrderHeader ON SalesOrderDetail.SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID
JOIN Customer ON Customer.CustomerID = SalesOrderHeader.Customer.CustomerID
WHERE Product.Name = 'Racing Socks'
AND Product.Size = 'L'