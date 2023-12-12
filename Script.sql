PRAGMA foreign_keys=TRUE;
CREATE TABLE Staff (
   id CHAR(3),
   name VARCHAR(20),
   email VARCAHR(30),
   phone_type VARCHAR(20),
   phone_number VARCAHR(20),
   address_street VARCHAR(20),
   address_city VARCHAR(20),
   address_postcode VARCHAR(20),
   PRIMARY KEY (id)
);

CREATE TABLE Manager (
   id CHAR(3),
   annual_salary NUMERIC(8,2),
   PRIMARY KEY (id),
   FOREIGN KEY (id) REFERENCES Staff
);

CREATE TABLE Driver (
   id CHAR(3),
   hourly_salary NUMERIC(4,2),
   PRIMARY KEY (id),
   FOREIGN KEY (id) REFERENCES Staff
);

CREATE TABLE Service (
   bus_number VARCHAR(10),
   origin VARCHAR(30),
   destination VARCHAR(30),
   PRIMARY KEY (bus_number)  
);

CREATE TABLE Drives (
   id CHAR(3),
   bus_number VARCHAR(10),
   hours_driven NUMERIC(2,2),
   PRIMARY KEY (id, bus_number),
   FOREIGN KEY (id) REFERENCES Driver,
   FOREIGN KEY (bus_number) REFERENCES Service
);

CREATE TABLE Stop (
   stop_name VARCHAR(30),
   PRIMARY KEY (stop_name)
);


CREATE TABLE Service_Time (
   bus_number VARCHAR(10),
   start_time TIME,
   PRIMARY KEY (bus_number, start_time),
   FOREIGN KEY (bus_number) REFERENCES Service
);

CREATE TABLE Time_On_Stop (
   stop_name VARCHAR(30),
   bus_number VARCHAR(10),
   arrival_time TIME,
   fare_from_origin NUMERIC(5,2),
   start_time TIME,
   PRIMARY KEY (stop_name, bus_number, start_time),
   FOREIGN KEY (stop_name) REFERENCES Stop,
   FOREIGN KEY (bus_number, start_time) REFERENCES Service_Time
);

CREATE TABLE Station (
   station_name VARCHAR(30),
   town VARCHAR(30),
   manager_id VARCHAR(3),
   PRIMARY KEY (station_name)
);

