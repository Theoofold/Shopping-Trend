SELECT *
 FROM shopping_trends;
 
 SELECT distinct age
 FROM shopping_trends
 ORDER BY age;
 
 -- 1.	Which age group spends the most on average?
 
 SELECT   
 CASE 
	WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN Age BETWEEN 46 AND 55 THEN '46-55'
    WHEN Age BETWEEN 56 AND 65 THEN '56-65'
    ELSE  '65+'
END AS Age_Group,
AVG(`Purchase Amount (USD)`) AS Avg_Spend
FROM shopping_trends
GROUP BY Age_Group
ORDER BY Avg_Spend DESC;

-- From this analysis, customer in the age group of 18-25 spend more than any other age group 

-- 2. Do subscription members spend more than non-members?

SELECT `Subscription Status`, AVG(`Purchase Amount (USD)`) AS Avg_Spend
FROM shopping_trends 
GROUP BY `Subscription Status`
ORDER BY Avg_Spend DESC;
-- From the above query, Member who are not subscribers spend more than those who are members 

-- 3.	What is gender distribution across product categories

SELECT gender, category, COUNT(*) AS purchase
FROM shopping_trends
GROUP BY gender, category;

-- 4.	Is there a difference in average spend by gender?

SELECT Gender, AVG(`Purchase Amount (USD)`) AS Avg_Spend
FROM shopping_trends
GROUP BY Gender;
-- Yes, this clearly shows that the Females then to spend more than the Males and the diffrence is 0.713

-- 5.	Which payment method is most popular in each location?

SELECT Location, `Payment Method`, COUNT(`Payment Method`) AS COUNT
FROM shopping_trends
GROUP BY Location, `Payment Method`
ORDER BY location, COUNT desc;

-- 6.	How does the use of discounts and promo codes affect average purchase amounts?

SELECT `Discount Applied`, `Promo Code Used`, AVG(`Purchase Amount (USD)`) AS Avg_spend
FROM shopping_trends
GROUP BY `Discount Applied`, `Promo Code Used`;
 
-- FROM THIS WE CAN SAY THOSE WHO USE THE DISCOUNT AND PROMO CODE SPEND LESS THAN CUSTOMERS WHO DO NOT USE BOTH PROMO CODE AND DISCOUNT OFFER

-- 7.	What is the average number of previous purchases per payment method?

SELECT `Payment Method`, AVG(`Previous Purchases`) Avg_Previous_Purchase
FROM shopping_trends
GROUP BY `Payment Method`;

-- 8.	Is there a relationship between purchase amount and frequency of purchases?

SELECT `Frequency of Purchases`, AVG(`Purchase Amount (USD)`) AS Avg_spend
FROM shopping_trends
GROUP BY `Frequency of Purchases`;

-- 9.	Which product categories are most popular in each season?

SELECT  Season, Category, COUNT(*) AS COUNT
FROM shopping_trends
GROUP BY Category, Season
ORDER BY Season, COUNT DESC;

--  10.	What are the most purchased item-size-color combinations?

SELECT Color, Size, COUNT(*) AS Count
FROM shopping_trends
GROUP BY Color, Size
ORDER BY Count DESC;

-- 11.	Which items generate the highest average revenue?

SELECT `Item Purchased`, AVG(`Purchase Amount (USD)`) AS Revenue
FROM shopping_trends
GROUP BY `Item Purchased`
ORDER BY Revenue DESC
LIMIT 1; -- Tshirt generates the highest revenue

-- 12.	How does seasonality impact product demand?

 SELECT Season, Category, COUNT(Category) AS product_demand
 FROM shopping_trends
 GROUP BY Season, Category 
 ORDER BY product_demand desc;
 
 -- 13.	Which shipping type is used most frequently?
 
 SELECT `Shipping Type`, COUNT(`Shipping Type`) AS No_of_times_used
 FROM shopping_trends
 GROUP BY `Shipping Type`
 ORDER BY 2 DESC;
 
--  Customer Satisfaction
-- 16.	Which product categories receive the highest average review ratings?

SELECT Category, AVG(`Review Rating`) AS Avg_Rating
FROM shopping_trends
GROUP BY Category ;


-- 17.	Is there a trend between the number of previous purchases and review ratings?

SELECT `Previous Purchases`, ROUND(AVG(`Review Rating`), 2) AS Avg_Rating
FROM shopping_trends
GROUP BY `Previous Purchases`
ORDER BY 1;

-- 18.	How does review rating vary across seasons?

SELECT Season, ROUND(AVG(`Review Rating`), 2) AS Review_Rating
FROM shopping_trends
GROUP BY season;

-- 19.	Do customers using certain payment methods leave better reviews?

SELECT `Payment Method`, ROUND(AVG(`Review Rating`), 2) AS Review_Rating
FROM shopping_trends
GROUP BY `Payment Method`;
