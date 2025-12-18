 -- SQL Assignment --

CREATE DATABASE ecommerce;
USE ecommerce;
-- Table for Product --
CREATE TABLE dim_products (
    ProductID VARCHAR(10) PRIMARY KEY,
    Category VARCHAR(50),
    Sub_category VARCHAR(50),
    Product_Name VARCHAR(100),
    Brand_Name VARCHAR(50),
    Size VARCHAR(10),
    Color VARCHAR(50),
    Ratings DECIMAL(3, 2)
);
-- Table for Customer --
CREATE TABLE dim_customers (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CustomerAge VARCHAR(10),
    City VARCHAR(50),
    State VARCHAR(50)
);
-- Table for Order Facts
CREATE TABLE fact_orders (
    OrderID VARCHAR(10),
    CustomerID VARCHAR(10),
    ProductID VARCHAR(10),
    OrderDate DATE,
    OriginalPrice DECIMAL(10, 2),
    Discount DECIMAL(3, 2),
    ShippingAddress VARCHAR(100)
);
-- Insert Data in all Table By Data Export --

-- Solution for Problem 1 --

SELECT
    Ratings,
    COUNT(ProductID) AS NumberOfRatings
FROM
    dim_products
GROUP BY
    Ratings
ORDER BY
    Ratings DESC;
    
-- Solution for Problem 2 --

SELECT
    Brand_Name,
    LOWER(Brand_Name) AS Lowercase_Brand_Name
FROM
    dim_products;
    
-- Solution for Problem 3 --

SELECT
    ProductID,
    Product_Name,
    Ratings,
    CASE
        WHEN Ratings >= 4.0 THEN 'Good'
        ELSE 'Low'
    END AS Rating_Category
FROM
    dim_products;
    
-- Solution for Problem 4 --

SELECT
    OrderID,
    OriginalPrice,
    (OriginalPrice - 10) AS ReducedPrice
FROM
    fact_orders
WHERE
    OriginalPrice IS NOT NULL;
    
-- Solution for Problem 5 --

SELECT
    *
FROM
    fact_orders
ORDER BY
    OriginalPrice DESC;
    
-- Solution for Problem 6 --

SELECT
    OrderID,
    OrderDate,
    EXTRACT(YEAR FROM OrderDate) AS OrderYear
FROM
    fact_orders;