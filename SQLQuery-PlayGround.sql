---
--- LAB 1 - Create Table
--- 
CREATE TABLE MsCustomer
(
	CustomerId CHAR (5) NOT NULL PRIMARY KEY,
	CustomerName VARCHAR (50) NOT NULL,
	CustomerGender VARCHAR (10) NOT NULL CHECK (CustomerGender IN ('Male', 'Female')),
	CustomerPhone VARCHAR (13) NOT NULL,
	CustomerAddress VARCHAR (100) NOT NULL
);

CREATE TABLE MsStaff
(
	StaffId CHAR (5) NOT NULL PRIMARY KEY,
	StaffName VARCHAR (50) NOT NULL,
	StaffGender VARCHAR (10) NOT NULL CHECK (StaffGender IN ('Male', 'Female')),
	StaffPhone VARCHAR (13) NOT NULL,
	StaffAddress VARCHAR (100) NOT NULL,
	StaffSalary NUMERIC  (11,2) NOT NULL,
	StaffPosition VARCHAR (20) NOT NULL
);

CREATE TABLE MsTreatmentType
(
	TreatmentTypeId CHAR (5) NOT NULL PRIMARY KEY,
	TreatmentTypeName VARCHAR (50) NOT NULL
);

CREATE TABLE MsTreatment
(
	TreatmentId CHAR (5) NOT NULL PRIMARY KEY,
	TreatmentTypeId CHAR (5) NOT NULL FOREIGN KEY REFERENCES MsTreatmentType (TreatmentTypeId), 
	TreatmentName VARCHAR (50) NOT NULL,
	Price NUMERIC (11,2) NOT NULL
);

CREATE TABLE HeaderSalonServices
(
	TransactionId CHAR (5) NOT NULL PRIMARY KEY,
	CustomerId CHAR (5) NOT NULL FOREIGN KEY REFERENCES MsCustomer(CustomerId),
	StaffId CHAR (5) NOT NULL FOREIGN KEY REFERENCES MsStaff(StaffId),
	TransactionDate DATE DEFAULT GETDATE(),
	PaymentType VARCHAR (20) NOT NULL
);

CREATE TABLE DetailSalonServices
(
	TransactionId CHAR (5) NOT NULL FOREIGN KEY REFERENCES HeaderSalonServices(TransactionId),
	TreatmentId CHAR (5) NOT NULL FOREIGN KEY REFERENCES MsTreatment(TreatmentId)
);

DROP TABLE DetailSalonServices;

CREATE TABLE DetailSalonServices
(
	TransactionId CHAR (5) NOT NULL FOREIGN KEY REFERENCES HeaderSalonServices(TransactionId),
	TreatmentId CHAR (5) NOT NULL FOREIGN KEY REFERENCES MsTreatment(TreatmentId)
);

ALTER TABLE DetailSalonServices ADD CONSTRAINT PK_Detail PRIMARY KEY (TransactionId, TreatmentId);

ALTER TABLE MsStaff ADD CONSTRAINT CHK_StaffName CHECK(DATALENGTH(StaffName)>=5 AND DATALENGTH(StaffName)<=20);

ALTER TABLE MsStaff DROP CONSTRAINT CHK_StaffName;

SELECT * FROM MsTreatment

ALTER TABLE MsTreatment ADD Descriptions VARCHAR (100);

ALTER TABLE MsTreatment DROP COLUMN Descriptions;

---
--- LAB 2 - Insert Table
--- 

INSERT INTO MsStaff (StaffId, StaffName, StaffGender, StaffPhone, StaffAddress, StaffSalary, StaffPosition) 
VALUES ('SF001','Dian felita Tanoto','Female','085265442222','Palmerah Street no 56',15000000,'Top Stylist'),
('SF002','Melissa Pratiwi','Female','085755552011','Kebun Jeruk Street no 151',10000000,'Top Stylist'),
('SF003', 'Livia Ashianti', 'Female', '085218542222', 'Kebun Jeruk Street no 19', 7000000, 'Stylist'),
('SF004', 'Indra Saswita', 'Male', '085564223311', 'Sunter Street no 91', 7000000, 'Stylist'),
('SF005', 'Ryan Nixon Salim', 'Male', '085710255522', 'Kebun Jeruk Street no 123', 3000000, 'Stylist'),
('SF006', 'Jeklin Harefa', 'Female', '085265433322', 'Kebon Jeruk Street no 140', 3000000, 'Stylist'),
('SF007', 'Lavinia', 'Female', '085755500011', 'Kebon Jeruk Street no 153', 3000000, 'Stylist'),
('SF008', 'Stephen Adrianto', 'Male', '085564223311', 'Mandala Street no 14', 3000000, 'Stylist'),
('SF009', 'Rico Wijaya', 'Male', '085710252525', 'Keluarga Street no 78', 3000000, 'Stylist');

INSERT INTO MsCustomer(CustomerId, CustomerName, CustomerGender, CustomerPhone, CustomerAddress) 
VALUES ('CU001', 'Franky', 'Male', '08566543338', 'Daan mogot baru Street no 6'),
('CU002', 'Emalia Dewi', 'Female', '085264782135', 'Tanjung Duren Street no 185'),
('CU003', 'Elysia Chen', 'Female', '085754206611', 'Kebun Jeruk Street no 120'),
('CU004', 'Brando Kartawijaya', 'Male', '081170225561', 'Greenvil Street no 88'),
('CU005', 'Andy Putra', 'Male', '087751321421', 'Sunter Street no 42');

INSERT INTO HeaderSalonServices(TransactionId, CustomerId, StaffId, TransactionDate, PaymentType) 
VALUES ('TR020', 'CU001', 'SF011', '2020/10/25', 'Credit')

INSERT INTO HeaderSalonServices(TransactionId, CustomerId, StaffId, TransactionDate, PaymentType) 
VALUES ('TR010', 'CU001', 'SF004', '2012/12/23', 'Credit'),
('TR011', 'CU002', 'SF006', '2012/12/24', 'Credit'),
('TR012', 'CU003', 'SF007', '2012/12/24', 'Cash'),
('TR013', 'CU004', 'SF005', '2012/12/25', 'Debit'),
('TR014', 'CU005', 'SF007', '2012/12/25', 'Debit'),
('TR015', 'CU005', 'SF005', '2012/12/26', 'Credit'),
('TR016', 'CU002', 'SF001', '2012/12/26', 'Cash'),
('TR017', 'CU003', 'SF002', '2012/12/26', 'Credit'),
('TR018', 'CU005', 'SF001', '2012/12/27', 'Cash');

INSERT INTO MsTreatment(TreatmentId, TreatmentTypeId, TreatmentName, Price) 
VALUES ('TM001','TT001','Cutting by stylist',150000),
('TM002','TT001','Cutting by top stylist',450000),
('TM003','TT001','Cutting pony',50000),
('TM004','TT001','blow',90000),
('TM005','TT001','Coloring',480000),
('TM006','TT001','highlight',320000),
('TM007','TT001','japanese perm',700000),
('TM008','TT001','digital perm',1100000),
('TM009','TT001','special perm',1100000),
('TM010','TT001','rebonding treatment',1100000),
('TM011','TT002','creambath',150000),
('TM012','TT002','hair spa',250000),
('TM013','TT002','hair mask',250000),
('TM014', 'TT002', 'Hair Spa Reflexy', 200000),
('TM015', 'TT002', 'Reflexy', 250000),
('TM016', 'TT002', 'Back Theraphy Massage', 300000),
('TM017', 'TT003', 'Make Up', 500000),
('TM018', 'TT003', 'Make Up Wedding', 5000000),
('TM019', 'TT003', 'Facial', 300000),
('TM020', 'TT004', 'Manicure', 80000),
('TM021', 'TT004', 'Pedicure', 100000),
('TM022', 'TT004', 'Nail Extension', 250000),
('TM023', 'TT004', 'Nail Crylic Infil', 340000),
('TM024', 'TT005', 'Japanese Treatment', 350000),
('TM025', 'TT005', 'Scalp Treatment', 250000),
('TM026', 'TT005', 'Crystal Treatment', 400000);

INSERT INTO MsTreatmentType(TreatmentTypeName, TreatmentTypeId) 
VALUES ('Styling Services','TT001'),
('Hair Treatment','TT002'),
('Make Up Treatment','TT003'),
('Nail Care','TT004'),
('Extra Services','TT005');

INSERT INTO DetailSalonServices(TransactionId, TreatmentId) 
VALUES ('TR010','TM003'),
('TR010','TM005'),
('TR010','TM010'),
('TR011','TM015'),
('TR011','TM025'),
('TR012','TM009'),
('TR013','TM003'),
('TR013','TM006'),
('TR013','TM015'),
('TR014','TM016'),
('TR015','TM016'),
('TR015','TM006'),
('TR016','TM015'),
('TR016','TM003'),
('TR016','TM005'),
('TR017','TM003'),
('TR018','TM006'),
('TR018','TM005'),
('TR018','TM007');

INSERT INTO HeaderSalonServices (TransactionId, CustomerId, StaffId, TransactionDate, PaymentType) 
VALUES ('TR019', 'CU005', 'SF004', DATEADD(DAY, 3, GETDATE()), 'Credit');

INSERT INTO MsStaff (StaffId, StaffName, StaffGender, StaffPhone, StaffAddress, StaffSalary, StaffPosition)
VALUES ('SF010', 'Effendy Lesmana', 'Male', '085218587878', 'Tanggerang City Street no. 88', ROUND(RAND()*(5000000-3000000+1000)+3000000, -5), 'Stylist');

UPDATE MsCustomer SET CustomerPhone=REPLACE(CustomerPhone, '08', '628');

UPDATE MsStaff SET StaffSalary=StaffSalary+7000000, StaffPosition='Top Stylist' 
WHERE StaffName LIKE '%Effendy Lesmana%';

UPDATE MsCustomer SET CustomerName=LEFT(CustomerName,CHARINDEX(' ',CustomerName)) 
FROM MsCustomer,HeaderSalonServices WHERE MsCustomer.CustomerId=HeaderSalonServices.CustomerId AND DATEPART(DAY,TransactionDate)=24

UPDATE MsCustomer SET CustomerName='Ms. '+CustomerName
WHERE CustomerId IN ('CU002', 'CU003');

UPDATE MsCustomer SET CustomerAddress = 'Daan Mogot Baru Street No 23'
WHERE CustomerId IN ( SELECT MsCustomer.CustomerId FROM MsCustomer WHERE EXISTS(
		SELECT HeaderSalonServices.CustomerId FROM MsStaff, HeaderSalonServices 
		WHERE MsCustomer.CustomerId=HeaderSalonServices.CustomerId 
		AND MsStaff.StaffId=HeaderSalonServices.StaffId 
		AND StaffName LIKE '%Indra Saswita%' 
		AND DATENAME(WEEKDAY, TransactionDate)='Sunday'
	)
)

DELETE HeaderSalonServices FROM HeaderSalonServices JOIN MsCustomer 
ON MsCustomer.CustomerId=HeaderSalonServices.CustomerId WHERE CHARINDEX(' ', CustomerName)=0

DELETE MsTreatment FROM MsTreatment JOIN MsTreatmentType 
ON MsTreatmentType.TreatmentTypeId=MsTreatment.TreatmentTypeId
WHERE TreatmentTypeName NOT LIKE '%Treatment%'

---
--- LAB 3 - Agregat Function
--- 

SELECT MAX(Price) AS 'Maximum Price', 
MIN(Price) AS 'Minimum Price', 
ROUND(CAST(AVG(Price) AS DECIMAL(10,2)), 0) AS 'Average Price' 
FROM MsTreatment


SELECT MsStaff.StaffPosition AS 'Staff Position', 
LEFT(MsStaff.StaffGender, 1) AS 'Gender', 
'Rp. ' + CAST(CAST(AVG(StaffSalary) AS DECIMAL(10, 2)) AS varchar(15)) AS 'Average Salary' 
FROM MsStaff GROUP BY StaffGender, StaffPosition


SELECT CONVERT(VARCHAR, TransactionDate, 107) AS 'Transaction Date', 
COUNT(TransactionDate) AS 'Total Transaction per Day' 
FROM HeaderSalonServices GROUP BY TransactionDate


SELECT UPPER(CustomerGender) AS 'Customer Gender', 
COUNT(CustomerGender) AS 'Total Transaction' 
FROM MsCustomer 
INNER JOIN HeaderSalonServices ON MsCustomer.CustomerId = HeaderSalonServices.CustomerId 
GROUP BY CustomerGender


SELECT	TreatmentTypeName, COUNT(TransactionId) AS 'Total Transaction'
FROM MsTreatmentType
INNER JOIN MsTreatment ON MsTreatmentType.TreatmentTypeId = MsTreatment.TreatmentTypeId
INNER JOIN DetailSalonServices ON MsTreatment.TreatmentId = DetailSalonServices.TreatmentId
GROUP BY TreatmentTypeName
ORDER BY TreatmentTypeName DESC;


SELECT CONVERT(VARCHAR, TransactionDate, 107) AS 'Date', 
'Rp. ' + CAST(CAST(SUM(MsTreatment.Price) AS DECIMAL(10, 2))AS VARCHAR(15)) AS 'Total Transaction'
FROM HeaderSalonServices
INNER JOIN DetailSalonServices ON HeaderSalonServices.TransactionId = DetailSalonServices.TransactionId
INNER JOIn MsTreatment ON DetailSalonServices.TreatmentId = MsTreatment.TreatmentId
GROUP BY HeaderSalonServices.TransactionDate HAVING SUM(MsTreatment.Price)BETWEEN 1000000 AND 5000000;


SELECT REPLACE(MsTreatment.TreatmentTypeId, 'TT0', 'Treatment Type') AS 'ID', 
MsTreatmentType.TreatmentTypeName, 
CAST(COUNT(MsTreatment.TreatmentTypeId) AS VARCHAR(15)) + ' Treatments' AS 'Total Treatment per Type' 
FROM MsTreatmentType 
INNER JOIN MsTreatment ON MsTreatmentType.TreatmentTypeId = MsTreatment.TreatmentTypeId
GROUP BY MsTreatment.TreatmentTypeId, TreatmentTypeName
HAVING COUNT(MsTreatment.TreatmentTypeId) > 5
ORDER BY COUNT(MsTreatment.TreatmentTypeId) DESC


SELECT CASE CHARINDEX(' ',MsStaff.StaffName) WHEN 0 THEN MsStaff.StaffName
ELSE LEFT(MsStaff.StaffName,CHARINDEX(' ',MsStaff.StaffName)-1)END AS StaffName, 
HeaderSalonServices.TransactionId, 
COUNT(DetailSalonServices.TreatmentId) AS "Total Treatment per Transaction"
FROM MsStaff,HeaderSalonServices,DetailSalonServices
WHERE HeaderSalonServices.StaffId = MsStaff.StaffId AND DetailSalonServices.TransactionId = HeaderSalonServices.TransactionId
GROUP BY MsStaff.StaffName, HeaderSalonServices.TransactionId;


SELECT TransactionDate, CustomerName, TreatmentName, Price FROM HeaderSalonServices
INNER JOIN MsCustomer ON HeaderSalonServices.CustomerId = MsCustomer.CustomerId
INNER JOIN MsStaff ON HeaderSalonServices.StaffId = MsStaff.StaffId
INNER JOIN DetailSalonServices ON HeaderSalonServices.TransactionId = DetailSalonServices.TransactionId
INNER JOIN MsTreatment ON DetailSalonServices.TreatmentId = MsTreatment.TreatmentId
WHERE StaffName LIKE '%Ryan%' AND DATENAME(WEEKDAY, TransactionDate)='Tuesday'
ORDER BY TransactionDate ASC, CustomerName ASC


SELECT TransactionDate, CustomerName, SUM(Price) AS 'Total Price' FROM HeaderSalonServices
INNER JOIN MsCustomer ON HeaderSalonServices.CustomerId = MsCustomer.CustomerId
INNER JOIN DetailSalonServices ON HeaderSalonServices.TransactionId = DetailSalonServices.TransactionId
INNER JOIN MsTreatment ON DetailSalonServices.TreatmentId = MsTreatment.TreatmentId
WHERE DATEPART(DAY,TransactionDate)>20
GROUP BY TransactionDate, CustomerName
ORDER BY TransactionDate ASC

---
--- LAB 4 - String and Date Functions
--- 

SELECT  * FROM MsStaff WHERE StaffGender IN ('Female');

SELECT  StaffName, StaffSalary = 'Rp. ' + CAST(StaffSalary AS VARCHAR)
FROM MsStaff WHERE StaffName LIKE '%m%' AND StaffSalary >= 10000000;

SELECT  tr.TreatmentName, tr.Price
FROM    MsTreatment tr, MsTreatmentType tt
WHERE   tr.TreatmentTypeId = tt.TreatmentTypeId
AND     tt.TreatmentTypeName IN ('Hair Treatment', 'Styling Services');

SELECT  staff.StaffName, staff.StaffPosition, CONVERT(VARCHAR, head.TransactionDate, 107) AS TransactionDate
FROM    HeaderSalonServices head, MsStaff staff
WHERE   head.StaffId = staff.StaffId
AND     staff.StaffSalary BETWEEN 7000000 AND 10000000;

SELECT CASE CHARINDEX(' ',cust.CustomerName) WHEN 0 THEN cust.CustomerName
ELSE LEFT(cust.CustomerName,CHARINDEX(' ',cust.CustomerName)-1)END AS CustomerName, 
SUBSTRING(cust.CustomerGender, 1, 1) AS CustomerGender, head.PaymentType
FROM    MsCustomer cust, HeaderSalonServices head
WHERE   head.CustomerId = cust.CustomerId
AND     head.PaymentType IN ('Debit');

SELECT  CONCAT(UPPER(LEFT(cust.CustomerName, 1)), UPPER(SUBSTRING(cust.CustomerName, CHARINDEX(' ', CustomerName) + 1, 1))) AS Initial, DATENAME(day, head.TransactionDate) AS Day
FROM    MsCustomer cust, HeaderSalonServices head
WHERE   cust.CustomerId = head.CustomerId
AND     DATEDIFF(day, '2012/12/24', head.TransactionDate) < 3


SELECT  head.TransactionDate, cust.CustomerName
FROM    MsCustomer cust, HeaderSalonServices head
WHERE   cust.CustomerId = head.CustomerId
AND     cust.CustomerName LIKE '% %'
AND     DATENAME(WEEKDAY, head.TransactionDate) = 'Monday';


SELECT  staff.StaffName, cust.CustomerName, REPLACE(cust.CustomerPhone, '08', '+62') AS CustomerPhone, cust.CustomerAddress
FROM    MsStaff staff, MsCustomer cust, HeaderSalonServices head
WHERE   head.CustomerId = cust.CustomerId
AND     head.StaffId = staff.StaffId
AND     LEN(staff.StaffName) - LEN(REPLACE(staff.StaffName, ' ', '')) >= 2
AND     (
            cust.CustomerName LIKE '%a%' OR
            cust.CustomerName LIKE '%i%' OR
            cust.CustomerName LIKE '%u%' OR
            cust.CustomerName LIKE '%e%' OR
            cust.CustomerName LIKE '%o%'
        );


SELECT  staff.StaffName, treat.TreatmentName, DATEDIFF(DAY, head.TransactionDate, '2012-12-24') AS 'Term of Transaction'
FROM    MsStaff staff, MsTreatment treat, HeaderSalonServices head, DetailSalonServices det
WHERE   staff.StaffId = head.StaffId
AND     det.TransactionId = head.TransactionId
AND     treat.TreatmentId = det.TreatmentId
AND     (
            LEN(treat.TreatmentName) > 20 OR
            LEN(treat.TreatmentName) - LEN(REPLACE(treat.TreatmentName, ' ', '')) >= 1
        );


SELECT  head.TransactionDate, cust.CustomerName, treat.TreatmentName, CAST((treat.Price * 20) / 100 AS INT) AS Discount, head.PaymentType
FROM    HeaderSalonServices head, MsCustomer cust, DetailSalonServices det, MsTreatment treat
WHERE   head.CustomerId = cust.CustomerId
AND     head.TransactionId = det.TransactionId
AND     det.TreatmentId = treat.TreatmentId
AND     DATEPART(DAY, head.TransactionDate) > 22;


SELECT CustomerName AS [Longest Name of Staff and Customer], LEN(CustomerName) AS [Length of Name], 'Customer' AS Status
FROM MsCustomer
WHERE LEN(CustomerName) = (SELECT MAX(LEN(CustomerName)) FROM MsCustomer) 
UNION
SELECT StaffName AS [Longest Name of Staff and Customer], LEN(StaffName) AS [Length of Name], 'Staff' AS Status
FROM MsStaff 
WHERE LEN(StaffName) = (SELECT MAX(LEN(StaffName)) FROM MsStaff); 




--
-- 1. TreatmentTypeName, TreatmentName, and Price for every treatment which name contains ‘hair’ or start with ‘nail’ word and has price below 100000.
--

SELECT      MsTreatmentType.TreatmentTypeName, 
            MsTreatment.TreatmentName, 
            MsTreatment.Price
FROM        MsTreatment
INNER JOIN  MsTreatmentType ON MsTreatment.TreatmentTypeId = MsTreatmentType.TreatmentTypeId
WHERE       (
                MsTreatmentType.TreatmentTypeName LIKE '%hair%'
                OR 
                MsTreatmentType.TreatmentTypeName LIKE '%nail%'
            )
AND         MsTreatment.Price < 100000;

--
-- 2. Display StaffName and StaffEmail (obtained from the first character of staff’s name in lowercase format and followed with last word of staff’s name and ‘@oosalon.com’ word) for every staff who handle transaction on Thursday.The duplicated data must be displayed only once
--

SELECT      DISTINCT MsStaff.StaffName, 
            LOWER(LEFT(MsStaff.StaffName, 1)) +
			CASE CHARINDEX(' ',MsStaff.StaffName) WHEN 0 THEN LOWER(MsStaff.StaffName)
			ELSE LOWER(RIGHT(MsStaff.StaffName, CHARINDEX(' ', REVERSE(MsStaff.StaffName)) - 1)) END + 
            '@oosalon.com' AS 'Staff Email' 
FROM        MsStaff
INNER JOIN  HeaderSalonServices ON HeaderSalonServices.StaffId = MsStaff.StaffId 
WHERE       DATENAME(WEEKDAY, HeaderSalonServices.TransactionDate) = 'Sunday'; 


--
-- 3. Display New Transaction ID (obtained by replacing ‘TR’ in TransactionID with ‘Trans’), Old Transaction ID (obtained from TransactionId), TransactionDate, StaffName, and CustomerName for every transaction which happened 2 days before 24th December 2012.
--

SELECT      REPLACE(HeaderSalonServices.TransactionId, 'TR', 'Trans') AS 'New Transaction ID', -- Replace 2 word 'TR' in TransactionID to 'Trans'
            HeaderSalonServices.TransactionId AS 'Old Transaction ID',
            HeaderSalonServices.TransactionDate, 
            MsStaff.StaffName, 
            MsCustomer.CustomerName
FROM        HeaderSalonServices
INNER JOIN  MsStaff ON MsStaff.StaffId = HeaderSalonServices.StaffId -- Join table MsStaff
INNER JOIN  MsCustomer ON MsCustomer.CustomerId = HeaderSalonServices.CustomerId -- Join table MsCustomer
WHERE       DATEDIFF(DAY, HeaderSalonServices.TransactionDate, '2012/12/27') = 2; -- Find data that happened 2 day before 24-12-2020

--
-- 4. Display New Transaction Date (obtained by adding 5 days to TransactionDate), OldTransaction Date (obtained from TransactionDate), and CustomerName for every transaction which didn’t happen on day 20th.
--

SELECT      DATEADD(DAY, 5, HeaderSalonServices.TransactionDate) AS 'New Transaction ID', -- Add 5 day of TransactionDate
            HeaderSalonServices.TransactionDate AS 'Old Transaction ID', 
            MsCustomer.CustomerName
FROM        HeaderSalonServices
INNER JOIN  MsCustomer ON MsCustomer.CustomerId = HeaderSalonServices.CustomerId -- Join table MsCustomer
WHERE       DATEPART(DAY, HeaderSalonServices.TransactionDate) != 20; -- Find TransactioDate that occour on day 20th

--
-- 5. Display Day (obtained from the day transaction happened), CustomerName, and TreatmentName for every Customer who was handled by female staff that has position name begin with 'TOP' word. Then order the data based on CustomerName in ascending format.
--

SELECT      DATENAME(WEEKDAY, HeaderSalonServices.TransactionDate) AS 'Day', -- Select the Day of TransactionDate
            MsCustomer.CustomerName, 
            MsTreatment.TreatmentName
FROM        HeaderSalonServices
INNER JOIN  MsCustomer ON MsCustomer.CustomerId = HeaderSalonServices.CustomerId -- Join Table MsCustomer
INNER JOIN  DetailSalonServices ON DetailSalonServices.TransactionId = HeaderSalonServices.TransactionId -- Join table DetailSalonServices
INNER JOIN  MsTreatment ON MsTreatment.TreatmentId = DetailSalonServices.TreatmentId -- Join table MsTreatment
INNER JOIN  MsStaff ON MsStaff.StaffId = HeaderSalonServices.StaffId -- Join MsStaff
WHERE       MsStaff.StaffGender IN ('Female') -- Find the Selected data that has StaffGender Female
AND         MsStaff.StaffPosition LIKE '%top%' -- Find the Selected data that has StaffPosition has 'top' word inside it
ORDER BY    MsCustomer.CustomerName ASC; -- Sort the CustomerName by Ascending Format

--
-- 6. Display the first data of CustomerId, CustomerName, TransactionId, Total Treatment (obtained from the total number of treatment). Then sort the data based on Total Treatment in descending format.
--

SELECT      TOP 1 MsCustomer.CustomerId, 
            MsCustomer.CustomerName, 
            HeaderSalonServices.TransactionId, 
            COUNT(DetailSalonServices.TreatmentId) AS 'Total Treatment' -- Count All TreatmentID with Selected CustomerName
FROM        MsCustomer
INNER JOIN  HeaderSalonServices ON HeaderSalonServices.CustomerId = MsCustomer.CustomerId -- Join table HeaderSalonServices
INNER JOIN  DetailSalonServices ON DetailSalonServices.TransactionId = HeaderSalonServices.TransactionId -- Join table TransactionId
GROUP BY    MsCustomer.CustomerId, 
            MsCustomer.CustomerName, 
            HeaderSalonServices.TransactionId -- Group the Data
ORDER BY    'Total Treatment' DESC; -- Sort Total Treatment In Descending Format

--
-- 7. Display CustomerId, TransactionId, CustomerName, and Total Price (obtained from total amount of price) for every transaction with total price is higher than the average value of treatment price from every transaction. Then sort the data based on Total Price in descending format.
--

SELECT      MsCustomer.CustomerId, 
            HeaderSalonServices.TransactionId, 
            MsCustomer.CustomerName, 
            SUM(MsTreatment.Price) AS 'Total Price' -- Sum the Price
FROM        MsCustomer
INNER JOIN  HeaderSalonServices ON HeaderSalonServices.CustomerId = MsCustomer.CustomerId -- Join Table HeaderSalonServices
INNER JOIN  DetailSalonServices ON DetailSalonServices.TransactionId = HeaderSalonServices.TransactionId -- Join Table DetailSalonServices
INNER JOIN  MsTreatment ON MsTreatment.TreatmentId = DetailSalonServices.TreatmentId -- Join table MsTreatment
GROUP BY    MsCustomer.CustomerId, 
            HeaderSalonServices.TransactionId, 
            MsCustomer.CustomerName -- Group the data
HAVING      SUM(MsTreatment.Price) > (
                SELECT SUM(a.Result) FROM (
                    SELECT AVG(MsTreatment.Price) AS Result
                ) AS a
            ) -- The Sum of Treatment Price must more then Sum of Average of Treatment Price
ORDER BY    'Total Price' DESC; -- Sort Total Price by Descending format

-- Crosscheck the Subquery
/* SELECT AVG(a.Result) AS 'Avg of Sum' FROM (SELECT CAST(SUM(MsTreatment.Price) AS DECIMAL(12, 0)) AS Result FROM MsTreatment) AS a */

--
-- 8. Display Name (obtained by adding ‘Mr. ’ in front of StaffName), StaffPosition, and StaffSalary for every male staff. The combine it with Name (obtained by adding ‘Ms. ’ in front of StaffName), StaffPosition, and StaffSalary for every female staff. Then sort the data based on Name and StaffPosition in ascending format.
--

SELECT      'Mr. ' + StaffName AS 'StaffName', -- Add 'Mr.' Before StaffName
            StaffPosition,
            StaffSalary
FROM        MsStaff
WHERE       StaffGender IN ('Male') -- Find every StaffGender that is Male
UNION
SELECT      'Ms. ' + StaffName AS 'StaffName', -- Add 'Ms.' Before StaffName
            StaffPosition,
            StaffSalary
FROM        MsStaff
WHERE       StaffGender IN ('Female'); -- Find every StaffGender that is Female

--
-- 9. Display TreatmentName, Price (obtained by adding ‘Rp. ’ in front of Price), and Status as ‘Maximum Price’ for every Treatment which price is the highest treatment’s price. Then combine it with TreatmentName, Price (obtained by adding ‘Rp. ’ in front of Price), and Status as ‘Minimum Price’ for every Treatment which price is the lowest treatment’s price.
--

SELECT      TreatmentName, 
            Price, 
            'Minimum Price' AS 'Status'
FROM        MsTreatment
WHERE       Price = (
    SELECT MIN(Price) FROM MsTreatment
) -- Find Price that is Minimum Value at table
UNION
SELECT      TreatmentName, 
            Price, 
            'Maximum Price' AS 'Status'
FROM        MsTreatment
WHERE       Price = (
    SELECT MAX(Price) FROM MsTreatment
); -- Find Price that is Maximum Value at table



SELECT      CustomerName, 
            LEN(CustomerName) AS 'Length of Name', 
            'Customer' AS 'Status'
FROM        MsCustomer
WHERE       LEN(CustomerName) = (
    SELECT  MAX(LEN(CustomerName)) FROM MsCustomer
)
UNION
SELECT      StaffName, 
            LEN(StaffName) AS 'Length of Name', 
            'Staff' AS 'Status'
FROM        MsStaff
WHERE       LEN(StaffName) = (
    SELECT  MAX(LEN(StaffName)) FROM MsStaff
);

--- ========================================LAB 7========================================================================

SELECT      TreatmentId, 
            TreatmentName
FROM        MsTreatment
WHERE       TreatmentId IN ('TM001') OR
            TreatmentId IN ('TM002');



SELECT      MsTreatment.TreatmentName, 
            MsTreatment.Price
FROM        MsTreatment, MsTreatmentType
WHERE       MsTreatment.TreatmentTypeId = MsTreatmentType.TreatmentTypeId
AND         MsTreatmentType.TreatmentTypeName NOT IN ('Hair Treatment')
AND         MsTreatmentType.TreatmentTypeName NOT IN ('Hair Spa Treatment');



SELECT      MsCustomer.CustomerName, 
            MsCustomer.CustomerPhone, 
            MsCustomer.CustomerAddress
FROM        MsCustomer, HeaderSalonServices
WHERE       MsCustomer.CustomerId = HeaderSalonServices.CustomerId
AND         LEN(MsCustomer.CustomerName) > 8
AND         DATENAME(WEEKDAY, HeaderSalonServices.TransactionDate) = 'Monday';


SELECT      MsTreatmentType.TreatmentTypeName, 
            MsTreatment.TreatmentName, 
            MsTreatment.Price
FROM        MsTreatment, 
            MsTreatmentType, 
            MsCustomer, 
            HeaderSalonServices, 
            DetailSalonServices
WHERE       MsTreatment.TreatmentTypeId = MsTreatmentType.TreatmentTypeId
AND         MsCustomer.CustomerId = HeaderSalonServices.CustomerId
AND         HeaderSalonServices.TransactionId = DetailSalonServices.TransactionId
AND         DetailSalonServices.TreatmentId = MsTreatment.TreatmentId
AND         MsCustomer.CustomerName LIKE '%putra%'
AND         DATENAME(DAY, HeaderSalonServices.TransactionDate) = 25;



SELECT      MsStaff.StaffName, MsCustomer.CustomerName, CONVERT(VARCHAR, HeaderSalonServices.TransactionDate, 107) AS TransactionDate
FROM        MsCustomer, MsStaff, HeaderSalonServices, DetailSalonServices
WHERE       EXISTS (
                SELECT  MsTreatment.TreatmentId 
                FROM    MsTreatment 
                WHERE   MsCustomer.CustomerId = HeaderSalonServices.CustomerId
                AND     MsStaff.StaffId = HeaderSalonServices.StaffId
                AND     HeaderSalonServices.TransactionId = DetailSalonServices.TransactionId
                AND     DetailSalonServices.TreatmentId = MsTreatment.TreatmentId
                AND     CONVERT(INT, RIGHT(MsTreatment.TreatmentId, 1)) % 2 = 0
            );



SELECT      CustomerName, CustomerPhone, CustomerAddress
FROM        MsCustomer
WHERE       EXISTS (
                SELECT  MsStaff.StaffName
                FROM    MsStaff, HeaderSalonServices
                WHERE   MsStaff.StaffId = HeaderSalonServices.StaffId
                AND     MsCustomer.CustomerId = HeaderSalonServices.CustomerId
                AND     LEN(MsStaff.StaffName) % 2 = 1
            );



SELECT      RIGHT(MsStaff.StaffId, 3) AS 'ID',
            SUBSTRING( MsStaff.StaffName, CHARINDEX(' ', MsStaff.StaffName) + 1, CHARINDEX(' ', MsStaff.StaffName) + 1) AS StaffName
FROM        MsStaff
WHERE       EXISTS (
                SELECT  MsStaff.StaffName, MsCustomer.CustomerName
                FROM    MsCustomer, HeaderSalonServices
                WHERE   MsCustomer.CustomerId = HeaderSalonServices.CustomerId
                AND     LEN(MsStaff.StaffName) - LEN(REPLACE(MsStaff.StaffName, ' ', '')) >= 2
                AND     MsCustomer.CustomerGender NOT LIKE 'Male'
            );



SELECT      MsTreatmentType.TreatmentTypeName,
            MsTreatment.TreatmentName,
            MsTreatment.Price
FROM        (SELECT AVG(Price) AS Result FROM MsTreatment) AS Avg_Price,
            MsTreatment, 
            MsTreatmentType
WHERE       MsTreatment.TreatmentTypeId = MsTreatmentType.TreatmentTypeId
AND         MsTreatment.Price > Avg_Price.Result;


SELECT      StaffName,
            StaffPosition,
            StaffSalary
FROM        MsStaff,
            (SELECT MIN(StaffSalary) AS Min_Salary, MAX(StaffSalary) AS Max_Salary FROM MsStaff) AS Salary
WHERE       StaffSalary = Salary.Max_Salary
OR          StaffSalary = Salary.Min_Salary
ORDER BY StaffSalary DESC


SELECT      MsCustomer.CustomerName, 
            MsCustomer.CustomerPhone,
            MsCustomer.CustomerAddress,
            COUNT(MsTreatment.TreatmentId) AS 'Count Treatment'
FROM        MsCustomer, 
            MsTreatment,
            HeaderSalonServices, 
            DetailSalonServices,
            (
                SELECT  MAX(b.Total) AS Max_Value
                FROM    (
                            SELECT      COUNT(MsTreatment.TreatmentId) AS Total
                            FROM        MsTreatment, 
                                        MsCustomer, 
                                        HeaderSalonServices, 
                                        DetailSalonServices
                            WHERE       MsCustomer.CustomerId = HeaderSalonServices.CustomerId
                            AND         MsTreatment.TreatmentId = DetailSalonServices.TreatmentId
                            AND         HeaderSalonServices.TransactionId = DetailSalonServices.TransactionId
                            GROUP BY    MsCustomer.CustomerName, MsCustomer.CustomerPhone, MsCustomer.CustomerAddress
                        ) AS b
            ) AS a
WHERE       MsCustomer.CustomerId = HeaderSalonServices.CustomerId
AND         MsTreatment.TreatmentId = DetailSalonServices.TreatmentId
AND         HeaderSalonServices.TransactionId = DetailSalonServices.TransactionId
GROUP BY    MsCustomer.CustomerName, 
            MsCustomer.CustomerPhone, 
            MsCustomer.CustomerAddress, 
            a.Max_Value
HAVING      COUNT(MsTreatment.TreatmentId) = a.Max_Value;