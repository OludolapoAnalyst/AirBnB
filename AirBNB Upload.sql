USE Airbnb
CREATE TABLE Airbnb_weekends( 	
airbnb_id int identity, 	
realSum float NULL, 	
room_type nvarchar(50) NULL, 	
room_shared nvarchar(50) NULL, 	
room_private nvarchar(50) NULL, 	
person_capacity tinyint NULL, 	
host_is_superhost nvarchar(50)NULL, 	
multi nvarchar(50) NULL, 	
biz bit NULL, 	
cleanliness_rating tinyint NULL, 	
guest_satisfaction_overall tinyint NULL, 	
bedrooms tinyint NULL, 	
dist float NULL, 	
metro_dist float NULL, 	
attr_index float NULL, 	
attr_index_norm float NULL, 	
rest_index float NULL,
rest_index_norm float NULL,
lng float NULL,
lat float NULL,
country nvarchar(25) NULL,
weekend nvarchar(10) NULL);
 DROP TABLE Airbnb_weekdays
 DROP TABLE Airbnb_weekends
CREATE TABLE Airbnb_weekdays( 	
airbnb_id int identity, 	
realSum float NULL, 	
room_type nvarchar(50) NULL, 	
room_shared nvarchar(50) NULL, 	
room_private nvarchar(50) NULL, 	
person_capacity tinyint NULL, 	
host_is_superhost nvarchar(50)NULL, 	
multi nvarchar(50) NULL, 	
biz bit NULL, 	
cleanliness_rating tinyint NULL, 	
guest_satisfaction_overall tinyint NULL, 	
bedrooms tinyint NULL, 	
dist float NULL, 	
metro_dist float NULL, 	
attr_index float NULL, 	
attr_index_norm float NULL, 	
rest_index float NULL,
rest_index_norm float NULL,
lng float NULL,
lat float NULL,
country nvarchar(25) NULL,
weekdays nvarchar(10) NULL);


BULK INSERT Airbnb_weekends
FROM 'C:\Users\somoy\OneDrive\Desktop\DATA ANALYTICS CLASS\Projects\DATA\Airbnb\Weekends\vienna_weekends.csv' 
WITH
(     
FORMAT='CSV',
FIRSTROW=2,  
FIELDTERMINATOR = ',',       
ROWTERMINATOR = '\n'   
)

UPDATE Airbnb_weekends 
SET COUNTRY = 'vienna',  weekend = 'Weekend' 
WHERE COUNTRY IS NULL and weekend IS NULL




BULK INSERT Airbnb_weekdays
FROM 'C:\Users\somoy\OneDrive\Desktop\DATA ANALYTICS CLASS\Projects\DATA\Airbnb\Weekdays\vienna_weekdays.csv' 
WITH
(     
FORMAT='CSV',
FIRSTROW=2,  
FIELDTERMINATOR = ',',       
ROWTERMINATOR = '\n'   
)

UPDATE Airbnb_weekdays 
SET COUNTRY = 'vienna',  weekdays = 'Weekday'
WHERE COUNTRY IS NULL and weekdays IS NULL


SELECT * FROM Airbnb_weekends;
SELECT * FROM Airbnb_weekdays;



--
CREATE VIEW Airbnb AS 
SELECT *FROM Airbnb_weekends
UNION ALL
SELECT *FROM Airbnb_weekdays

SELECT * FROM Airbnb;