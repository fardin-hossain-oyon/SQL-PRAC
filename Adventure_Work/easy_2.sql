SELECT Customer.CompanyName
FROM CustomerAddress
JOIN Customer ON Customer.CustomerID = CustomerAddress.CustomerID
JOIN Address ON CustomerAddress.AddressID = Address.AddressID
WHERE Address.City = 'Dallas'