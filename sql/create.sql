CREATE TABLE patient
(
  ID INT NOT NULL,
  name VARCHAR(30) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE pharmacist
(
  ID INT NOT NULL,
  name VARCHAR(30) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE medicine
(
  name VARCHAR(50) NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY (name)
);

CREATE TABLE buying_medicine
(
  time DATE NOT NULL,
  medicine_name VARCHAR(50) NOT NULL,
  PatientID INT NOT NULL,
  PharmID INT NOT NULL,
  PRIMARY KEY (time, medicine_name, PatientID),
  FOREIGN KEY (medicine_name) REFERENCES medicine(name),
  FOREIGN KEY (PatientID) REFERENCES patient(ID),
  FOREIGN KEY (PharmID) REFERENCES pharmacist(ID)
);

CREATE TABLE Building
(
  ID INT NOT NULL,
  address VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE room
(
  room_number INT NOT NULL,
  building_ID INT NOT NULL,
  PRIMARY KEY (room_number, building_ID),
  FOREIGN KEY (building_ID) REFERENCES Building(ID)
);

CREATE TABLE medical_attendant
(
  name VARCHAR(30) NOT NULL,
  ID INT NOT NULL,
  PRIMARY KEY (ID)
);



CREATE TABLE doctor
(
  licenseNum INT NOT NULL,
  role VARCHAR(50) NOT NULL,
  ID INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID) REFERENCES medical_attendant(ID),
  UNIQUE (licenseNum)
);

CREATE TABLE nurse
(
  role VARCHAR(50) NOT NULL,
  ID INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID) REFERENCES medical_attendant(ID)
);

CREATE TABLE treatment
(
  time DATE NOT NULL,
  Duration INT,
  AttendantID INT NOT NULL,
  PatientID INT NOT NULL,
  room_number INT NOT NULL,
  Building_ID INT NOT NULL,
  PRIMARY KEY (time, AttendantID, PatientID),
  FOREIGN KEY (AttendantID) REFERENCES medical_attendant(ID),
  FOREIGN KEY (PatientID) REFERENCES patient(ID),
  FOREIGN KEY (room_number, Building_ID) REFERENCES room(room_number, building_ID)
);

CREATE TABLE using_medicine
(
  medicine_name VARCHAR(50) NOT NULL,
  time DATE NOT NULL,
  AttendantId INT NOT NULL,
  PatientID INT NOT NULL,
  PRIMARY KEY (medicine_name),
  FOREIGN KEY (medicine_name) REFERENCES medicine(name),
  FOREIGN KEY (time, AttendantId, PatientID) REFERENCES treatment(time, AttendantID, PatientID)
);
