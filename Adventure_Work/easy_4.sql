SELECT Customer.CompanyName, SubTotal+TaxAmt+Freight
FROM Customer
JOIN SalesOrderHeader ON Customer.CustomerID = SalesOrderHeader.CustomerID
WHERE SalesOrderHeader.SubTotal > 100000