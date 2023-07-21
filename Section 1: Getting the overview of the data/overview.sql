
-- 1) Different color segments (categories) provided by the company.
SELECT COUNT(DISTINCT Item_Category) 
FROM Item;


--2) Different Coupon Types that are offered.
SELECT COUNT(DISTINCT couponType) 
FROM CouponMapping;


--3) States where the company is currently delivering its products and services.
SELECT COUNT(DISTINCT State) 
FROM CityData;


--4) Different Order Types.
SELECT COUNT(DISTINCT OrderType) 
FROM CustomerTransactionData;


--5) total number of sales (transactions) happened by Yearly basis.
SELECT YEAR(PurchaseDate),
  COUNT(Trans_Id) AS Total_Trans
FROM CustomerTransactionData
GROUP BY YEAR(PurchaseDate);


--6) total number of sales (transactions) happened by Quarterly basis
SELECT EXTRACT(QUARTER FROM PurchaseDate),
      COUNT(Trans_Id) AS Total_Trans
FROM CustomerTransactionData
GROUP BY EXTRACT(QUARTER FROM PurchaseDate);


--7) total number of sales (transactions) happened by Yearly and Monthly basis
SELECT EXTRACT(YEAR FROM PurchaseDate),
  EXTRACT(MONTH FROM PurchaseDate),
  COUNT(Trans_Id) AS Total_Trans
FROM CustomerTransactionData
GROUP BY EXTRACT(YEAR FROM PurchaseDate),
        EXTRACT(MONTH FROM PurchaseDate);


--8) total purchase order by Product category
SELECT I.Item_Category,
  SUM(PurchasingAmt) AS Total_Sales
FROM CustomerTransactionData AS C
JOIN
  Item AS I
  ON C.item_id = I.item_id
GROUP BY I.Item_Category;


--9) total purchase order by Yearly and Quarterly basis
SELECT EXTRACT(YEAR FROM PurchaseDate),
  EXTRACT(QUARTER FROM PurchaseDate),
  SUM(PurchasingAmt) AS Total_Sales
FROM CustomerTransactionData
GROUP BY EXTRACT(YEAR FROM PurchaseDate), 
        EXTRACT(QUARTER FROM PurchaseDate);


--10) total purchase order by Order Type
SELECT OrderType,
  SUM(PurchasingAmt) AS Total_Sales
FROM CustomerTransactionData
GROUP BY OrderType;


--11) total purchase order by City Tier
SELECT CityTier,
  SUM(PurchasingAmt) AS Total_Sales
FROM CustomerTransactionData AS CT
JOIN
  Customer AS C
  ON C.Customer_Id = CT.Cust_Id
JOIN CityData
  ON CityData.City_Id = C.City_Id
GROUP BY CityTier;










