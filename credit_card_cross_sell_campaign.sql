-- PROJECT: Bank Marketing Campaign: Credit Card Cross-Sell
-- DESCRIPTION: Analyzing 245,000+ customer records to find 
-- high-converting demographics and optimize marketing budget.


-- SETUP: Data Cleaning

CREATE OR REPLACE VIEW campaign_data_clean AS
SELECT 
    ID, 
    Gender, 
    Age, 
    Region_Code, 
    Occupation, 
    Channel_Code, 
    Vintage,
    COALESCE(NULLIF(Credit_Product, ''), 'Unknown') AS Credit_Product_Status,
    Avg_Account_Balance, 
    Is_Active, 
    Is_Lead
FROM customers;


-- QUERY 1: What is the baseline success rate of the campaign?

SELECT 
    COUNT(ID) AS Total_Customers_Targeted,
    SUM(Is_Lead) AS Total_Leads_Generated,
    ROUND((SUM(Is_Lead) / COUNT(ID)) * 100, 2) AS Overall_Conversion_Pct
FROM campaign_data_clean;


-- QUERY 2: Which communication channels worked best?

SELECT 
    Channel_Code,
    COUNT(ID) AS Total_Targeted,
    SUM(Is_Lead) AS Leads_Generated,
    ROUND((SUM(Is_Lead) / COUNT(ID)) * 100, 2) AS Conversion_Rate_Pct
FROM campaign_data_clean
GROUP BY Channel_Code
ORDER BY Conversion_Rate_Pct DESC;

-- QUERY 3: Which professions are actually interested in a new card?

SELECT 
    Occupation,
    COUNT(ID) AS Total_Targeted,
    SUM(Is_Lead) AS Leads_Generated,
    ROUND((SUM(Is_Lead) / COUNT(ID)) * 100, 2) AS Conversion_Rate_Pct
FROM campaign_data_clean
GROUP BY Occupation
ORDER BY Conversion_Rate_Pct DESC;


-- QUERY 4: How does existing credit history affect a customer's choice?

SELECT 
    Credit_Product_Status,
    COUNT(ID) AS Total_Customers,
    SUM(Is_Lead) AS Leads_Generated,
    ROUND((SUM(Is_Lead) / COUNT(ID)) * 100, 2) AS Conversion_Rate_Pct
FROM campaign_data_clean
GROUP BY Credit_Product_Status
ORDER BY Conversion_Rate_Pct DESC;


-- QUERY 5: How can the bank prioritize its next marketing budget?

SELECT 
    CASE 
        WHEN Credit_Product_Status = 'Unknown' AND Occupation IN ('Entrepreneur', 'Self_Employed') THEN 'P1: Ultimate Target'
        WHEN Credit_Product_Status = 'Yes' AND Channel_Code IN ('X2', 'X3') THEN 'P2: High Priority'
        WHEN Credit_Product_Status = 'No' AND Occupation = 'Salaried' THEN 'P4: Do Not Target'
        ELSE 'P3: Standard Target'
    END AS Priority_Tier,
    COUNT(ID) AS Total_Customers,
    SUM(Is_Lead) AS Leads_Generated,
    ROUND((SUM(Is_Lead) / COUNT(ID)) * 100, 2) AS Conversion_Rate_Pct
FROM campaign_data_clean
GROUP BY Priority_Tier
ORDER BY Priority_Tier;