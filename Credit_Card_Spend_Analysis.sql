-- We will analyse the Credit cards data in this session.

-- Creating a database
CREATE DATABASE Credit_Cards;

-- Using the database for table creation and storing data.
USE Credit_Cards;

-- Create a table to store credit card data.
CREATE TABLE Credit_Card_Data(
	`index` INT ,
	City VARCHAR(50),
	`Date` VARCHAR(30),
	Card_Type VARCHAR(30),
	Exp_Type VARCHAR(30),
	Gender VARCHAR(30),
	Amount INT,
	`Year` INT,
	`Month` VARCHAR(30));
    
-- Load the data into the table from a csv file.
LOAD DATA INFILE 'D:/SQL Work/CreditCards.csv'   -- 'Excel File Path'
INTO TABLE Credit_card_Data
FIELDS TERMINATED BY ','                     -- As the file is csv, we are using comma for value separaion'.
ENCLOSED BY '"'                              -- The values are inside the "".
LINES TERMINATED BY '\n'                     -- To move to the next row.
IGNORE 1 ROWS ;  

-- Check the data 
SELECT * FROM Credit_Card_Data;

-- #1. Which city has spent the highest amount over the years?
SELECT City, SUM(Amount) AS Total_Amount FROM Credit_Card_Data 
GROUP BY City ORDER BY Total_amount DESC LIMIT 1;

-- #2. Which card type has the highest amount over the years?
SELECT Card_Type, SUM(Amount) AS Total_Amount FROM Credit_Card_Data 
GROUP BY Card_Type ORDER BY Total_amount DESC LIMIT 1;

-- #3. Which expense type has the highest amount over the years?
SELECT Exp_Type, SUM(Amount) AS Total_Amount FROM Credit_Card_Data 
GROUP BY Exp_Type ORDER BY Total_amount DESC LIMIT 1;

-- #4. what is the total amount spent between males and females in numbers and percentage?
SELECT Gender, SUM(Amount) AS Total_Amount,sum(Amount)*100/ 
(select (sum(Amount)) as Amount
from Credit_Card_Data) as percent_of_total 
FROM Credit_Card_Data GROUP BY Gender ORDER BY percent_of_total DESC;

-- #5. What is the total amount of spend by females on Card_Type?
SELECT Gender,Card_Type, SUM(Amount) AS Total_Amount FROM Credit_Card_Data
WHERE Gender = 'F' GROUP BY Card_Type ORDER BY Total_Amount;

-- #6. Which are the top 5 cities which has the highest spend for men?
SELECT City, Gender, SUM(Amount) AS Total_Amount FROM Credit_Card_Data 
WHERE Gender = 'M' GROUP BY City ORDER BY Total_Amount DESC LIMIT 5;

-- #7. List the top 5 cities with the maximum transactions?
SELECT City, COUNT(*) AS Total_Transactions FROM Credit_Card_Data
GROUP BY City ORDER BY Total_Transactions DESC LIMIT 5;

-- #8.Show the month wise spend across the years
SELECT `Month`, SUM(Amount) AS Total_Amount FROM Credit_Card_Data
GROUP BY `Month` ORDER BY Total_Amount DESC;

-- #9. Show the total amount spent by men via expense type?
SELECT Gender, Exp_Type, SUM(Amount) AS Total_Amount FROM Credit_Card_Data
WHERE Gender = 'M' GROUP BY Exp_Type ORDER BY Total_Amount DESC;





