SELECT ProductDescription.Description
FROM ProductDescription
JOIN
(
    SELECT ProductModelProductDescription.ProductDescriptionID
    FROM ProductModel
    JOIN ProductModelProductDescription ON ProductModel.ProductModelID = ProductModelProductDescription.ProductModelID
    JOIN Product.ProductModelID = ProductModel.ProductModelID
    WHERE Product.ProductID = 736
    AND ProductModelProductDescription.Culture = 'fr'
) t1
ON t1.ProductDescriptionID = ProductDescription.ProductDescriptionID