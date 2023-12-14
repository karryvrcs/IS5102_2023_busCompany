INSERT INTO Service VALUES
   ('99', 'St Andrews Bus Station', 'Dundee City Centre'),
   ('X59', 'St Andrews Bus Station', 'Edinburgh Bus Station'),
   ('91', 'St Andrews Bus Station', 'Bogward'),
   ('X77', 'Glasgow', 'Ayr'),
   ('29', 'Grosvenor Road', 'Royal Free Hospital');
   
INSERT INTO Service_Time VALUES
   ('X59', '06:40:00'),
   ('X59', '07:20:00'),
   ('X59', '08:10:00'),
   ('X59', '09:00:00'),
   ('X59', '10:00:00'),
   ('99', '17:40:00'),
   ('99', '18:00:00'),
   ('99', '18:20:00'),
   ('99', '18:40:00'),
   ('99', '19:00:00'),
   ('99', '19:20:00');
  
INSERT INTO Service_Time VALUES
   ('99', '17:45:00');
   ('99', '18:05:00');
  
INSERT INTO Service_Time VALUES
   ('99', '17:55:00'),
   ('99', '18:15:00');  
  
INSERT INTO Stop VALUES
   ('Leuchars');
  
INSERT INTO Stop VALUES
   ('Old Course'),
   ('Overgate');
  
INSERT INTO Time_On_Stop VALUES
   ('Old Course', '99', '17:45:00', 5.3, '17:40:00'),
   ('Old Course', '99', '18:05:00', 5.3, '18:00:00');
   
INSERT INTO Time_On_Stop VALUES
   ('Leuchars', '99', '17:55:00', 5.3, '17:40:00'),
   ('Leuchars', '99', '18:15:00', 5.3, '18:00:00');  

SELECT A.bus_number FROM Service
NATURAL JOIN Service_Time AS A
LEFT JOIN Time_On_Stop AS B
ON B.bus_number = A.bus_number
AND B.start_time = A.start_time
WHERE destination LIKE '%Dundee%'
ORDER BY B.bus_number DESC, A.start_time DESC;

UPDATE Time_On_Stop 
SET arrival_time = '17:53:00'
WHERE arrival_time ='17:55:00';

CREATE VIEW bus_time_table AS
SELECT * FROM Service
NATURAL JOIN Service_Time AS A
LEFT JOIN Time_On_Stop AS B
ON B.bus_number = A.bus_number
AND B.start_time = A.start_time
WHERE destination LIKE '%Dundee%'
ORDER BY bus_number DESC, A.start_time DESC;

CREATE VIEW bus_time_table AS
SELECT A.bus_number AS bus_num, stop_name, arrival_time
FROM Service
NATURAL JOIN Service_Time AS A
LEFT JOIN Time_On_Stop AS B
ON B.bus_number = A.bus_number
AND B.start_time = A.start_time
WHERE destination LIKE '%Dundee%'
ORDER BY bus_num DESC, A.start_time DESC;

SELECT * FROM bus_time_table;


