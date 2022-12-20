CREATE TABLE Clinic(
clinicNo CHAR(5) NOT NULL,
street VARCHAR2(40) NOT NULL, 
city VARCHAR2(15) NOT NULL, 
state CHAR(2) NOT NULL, 
zipCode VARCHAR2(9) NOT NULL UNIQUE, 
telNo VARCHAR2(20) NOT NULL UNIQUE, 
faxNo VARCHAR2(20) NOT NULL UNIQUE, 
mgrStaffNo CHAR(4),
PRIMARY KEY (clinicNo)
);

INSERT INTO clinic values('c1111','1275 Garden Grove Blvd.','Garden Grove','CA','92345','(714) 
923-9223','(714) 923-9224','s112');
INSERT INTO clinic values('c1112','20429 Yorba Linda Blvd.','Yorba Linda','CA','92845','(714) 996-
7610','(714) 996-7611','s115');
INSERT INTO clinic values('c1113','15808 Imperial Hwy','Brea','CA','92635','(714) 283-5898','(714) 
283-5899','s117');
INSERT INTO clinic values('c1114','15400 Computer Blvd.','Fullerton','CA','92834','(714) 278-
5898','(714) 278-5899',null);

CREATE TABLE Staff(
staffNo CHAR(4) NOT NULL, 
sFName VARCHAR2(30) NOT NULL, 
sLName VARCHAR2(30) NOT NULL, 
sStreet VARCHAR2(40) NOT NULL, 
sCity VARCHAR2(15) NOT NULL, 
sState CHAR(2) NOT NULL, 
sZipCode VARCHAR2(9)NOT NULL, 
sTelNo VARCHAR2(20) NOT NULL, 
DOB DATE NOT NULL, 
gender CHAR NOT NULL, 
SSN VARCHAR2(12) NOT NULL UNIQUE, 
position VARCHAR2(20) NOT NULL, 
salary NUMBER(8,2) NOT NULL CHECK( salary > 0), 
clinicNo CHAR(5) NOT NULL,
PRIMARY KEY (staffNo),
CONSTRAINT clinicnumber FOREIGN KEY (clinicNo) REFERENCES Clinic(clinicNo)
);

INSERT INTO staff VALUES('s111','David','Johnsson','1255 Garden Grove Blvd.','Garden 
Grove','CA','92345','(714) 223-2223',to_date('1-aug-1970','dd-mon-
yyyy'),'M','111111111','clerk',40000,'c1111');
INSERT INTO staff VALUES('s112','Steve','John','1150 Fullerton St.','Fullerton','CA','92344','(714) 
222-2113',to_date('1-jul-1960','dd-mon-yyyy'),'M','222112222','manager',50000,'c1111');
INSERT INTO staff VALUES('s113','Hess','Edward','12121 Beach Blvd.','Newport 
Beach','CA','99923','(996) 111-2221',to_date('1-aug-1959','dd-mon-
yyyy'),'F','333113333','vet',60000,'c1112');
INSERT INTO staff VALUES('s114','Hester','Britten','8712 W Lambert Rd.','Brea','CA','92845','(714) 
297-9827',to_date('1-aug-1979','dd-mon-yyyy'),'M','444114444','manager',45000,'c1112');
INSERT INTO staff VALUES('s115','Hoo','Don','3481 E Elm','Fullerton','CA','92811','(714) 113-
1113',to_date('1-aug-1974','dd-mon-yyyy'),'F','555115555','manager',60000,'c1112');
INSERT INTO staff VALUES('s116','Hong','Soo','6511 W. Chapman','La Habra','CA','92732','(715) 333-
7723',to_date('1-aug-1976','dd-mon-yyyy'),'M','666116666','clerk',41000,'c1113');
INSERT INTO staff VALUES('s117','Hill','Rowland','3411 Ahn Hill','Placentia','CA','92845','(714) 
578-9137',to_date('1-aug-1971','dd-mon-yyyy'),'M','777117777','manager',48000,'c1113');
INSERT INTO staff VALUES('s118','Gomez','Rachel','2101 Victoria Dr.','Irvine','CA','92176','(949) 
631-8888',to_date('1-aug-1969','dd-mon-yyyy'),'M','888118888','vet',70000,'c1113');

ALTER TABLE Clinic
ADD CONSTRAINT mgrstaffnumber FOREIGN KEY (mgrStaffNo) REFERENCES Staff(staffNo);

CREATE TABLE PetOwner(
ownerNo CHAR(5) NOT NULL, 
oFName VARCHAR2(30) NOT NULL, 
oLName VARCHAR2(30) NOT NULL, 
oStreet VARCHAR2(40) NOT NULL, 
oCity VARCHAR2(15) NOT NULL,
oState CHAR(2) NOT NULL, 
oZipCode VARCHAR2(9), 
oTelNo VARCHAR2(20) NOT NULL, 
clinicNo CHAR(5) NOT NULL,
PRIMARY KEY (ownerNo),
CONSTRAINT clinicnumber1 FOREIGN KEY (clinicNo) REFERENCES Clinic(clinicNo)
);

INSERT INTO PetOwner VALUES('o1111','Kevin','Lawrence','1262 Warren 
Place','Anaheim','CA','92345','(946) 921-1223','c1112');
INSERT INTO PetOwner VALUES('o1112','Gomez','Rachel','2101 Victoria 
Dr.','Irvine','CA','92176','(949) 631-8888','c1111');
INSERT INTO PetOwner VALUES('o1113','Charles','Lawrence','1728 W 5th SantaAna','La 
Palma','CA','92744','(714) 771-7878','c1111');
INSERT INTO PetOwner VALUES('o1114','Carlton','William','1212 Harbor 
Blvd.','Fullerton','CA','92834','(714) 279-2223','c1112');
INSERT INTO PetOwner VALUES('o1115','Bruce','Bender','201 W. La Habra 
Blvd.','Yorbalinda','CA','92877','(714) 566-5555','c1113');

CREATE TABLE Pet(
petNo CHAR(6) NOT NULL, 
petName VARCHAR2(30) NOT NULL, 
petType VARCHAR2(20) NOT NULL, 
petDesc VARCHAR2(40) NOT NULL, 
petDOB DATE NOT NULL, 
dateRegistered DATE NOT NULL, 
petStatus CHAR NOT NULL, 
ownerNo CHAR(5), 
clinicNo CHAR(5),
PRIMARY KEY (petNo),
CONSTRAINT ownernumber FOREIGN KEY (ownerNo) REFERENCES PetOwner(ownerNo),
CONSTRAINT clinicnumber2 FOREIGN KEY (clinicNo) REFERENCES Clinic(clinicNo)
);

INSERT INTO Pet VALUES('pt1111','Lucky','Chihuahua','Friendly',to_date('30-nov-1994','dd-mon-
yyyy'), to_date('10-aug-1995','dd-mon-yyyy'), 'Y','o1111','c1112');
INSERT INTO Pet VALUES('pt1122','Bell','Golden retriever','Active',to_date('4-mar-2001','dd-mon-
yyyy'), to_date('2-may-2001','dd-mon-yyyy'), 'N',null,'c1111');
INSERT INTO Pet VALUES('pt1133','Sleepy','Labrador','Quiet',to_date('9-jan-2000','dd-mon-yyyy'), 
to_date('12-nov-1998','dd-mon-yyyy'), 'Y','o1113','c1111');
INSERT INTO Pet VALUES('pt1144','Gentle','Boxer','Shy',to_date('18-jan-1999','dd-mon-yyyy'), 
to_date('9-oct-1999','dd-mon-yyyy'), 'N','o1114','c1112');
INSERT INTO Pet VALUES('pt1155','Bark','German Shepherd','Noisy',to_date('10-feb-1998','dd-mon-
yyyy'), to_date('12-nov-1998','dd-mon-yyyy'), 'Y','o1115','c1113');
INSERT INTO Pet VALUES('pt1166','Big','Pit Bull','Scary',to_date('10-feb-1999','dd-mon-yyyy'), 
to_date('12-nov-2000','dd-mon-yyyy'), 'Y','o1115',null);
INSERT INTO Pet VALUES('pt1177','Accent','Chihuahua','Agressive',to_date('10-feb-2001','dd-mon-
yyyy'), to_date('12-aug-2001','dd-mon-yyyy'), 'Y',null,'c1112');

CREATE TABLE Examination(
examNo CHAR(6) NOT NULL, 
examDate DATE NOT NULL, 
examTime NUMBER(4, 2) NOT NULL, 
examResults VARCHAR2(40) NOT NULL, 
petNo CHAR(6) NOT NULL, 
staffNo CHAR(4) NOT NULL,
PRIMARY KEY (examNo),
CONSTRAINT ExaminationAK UNIQUE (staffNo, examDate, examTime),
CONSTRAINT petnumber FOREIGN KEY (petNo) REFERENCES Pet(petNo),
CONSTRAINT staffnumber FOREIGN KEY (staffNo) REFERENCES Staff(staffNo)
);

INSERT INTO Examination VALUES('e11111',to_date('1-aug-1998','dd-mon-
yyyy'),12.45,'fine','pt1111','s113');
INSERT INTO Examination VALUES('e11112',to_date('10-oct-2001','dd-mon-yyyy'),10.30,'Eye is 
red','pt1122','s111');
INSERT INTO Examination VALUES('e11113',to_date('25-jun-2001','dd-mon-yyyy'),14.15,'needs 
diet','pt1155','s118');
INSERT INTO Examination VALUES('e11114',to_date('20-nov-1999','dd-mon-yyyy'),09.25,'needs balanced 
nutrition','pt1144','s113');
INSERT INTO Examination VALUES('e11115',to_date('19-feb-1999','dd-mon-yyyy'),10.05,'vaccinization 
required','pt1155','s118');

CREATE TABLE Treatment(
treatNo CHAR(4) NOT NULL, 
description VARCHAR2(40) NOT NULL, 
cost NUMBER(5, 2) NOT NULL,
PRIMARY KEY (treatNo)
);

INSERT INTO Treatment VALUES('t001','Bellyache',15);
INSERT INTO Treatment VALUES('t002','Tail Docking',40);
INSERT INTO Treatment VALUES('t003','Diabetes',25);
INSERT INTO Treatment VALUES('t004','Spray',10);
INSERT INTO Treatment VALUES('t006','Neuter',100);
INSERT INTO Treatment VALUES('t007','penicillin anitibiotic course',50);
INSERT INTO Treatment VALUES('t008','feline hysterectomy',200);
INSERT INTO Treatment VALUES('t009','vaccination course against feline flu',70);
INSERT INTO Treatment VALUES('t010','small dog-stay in pen per day',20);

CREATE TABLE Pen(
penNo CHAR(4) NOT NULL, 
penCapacity NUMBER DEFAULT 2 NOT NULL CHECK (penCapacity BETWEEN 1 AND 4), 
penStatus CHAR DEFAULT 'A' NOT NULL CHECK (penStatus = 'A' OR penStatus = 'N'),
clinicNo CHAR(5) NOT NULL,
PRIMARY KEY (penNo),
CONSTRAINT clinicnumber3 FOREIGN KEY (clinicNo) REFERENCES Clinic(clinicNo)
);

INSERT INTO Pen VALUES('p001',2,'A','c1111');
INSERT INTO Pen VALUES('p002',2,'A','c1111');
INSERT INTO Pen VALUES('p003',4,'A','c1112');
INSERT INTO Pen VALUES('p004',2,'N','c1113');
INSERT INTO Pen VALUES('p005',3,'A','c1111');
INSERT INTO Pen VALUES('p006',4,'N','c1112');
INSERT INTO Pen VALUES('p007',2,'A','c1113');
INSERT INTO Pen VALUES('p008',2,'A','c1111');

CREATE TABLE PetPen(
penNo CHAR(4) NOT NULL, 
petNo CHAR(6) NOT NULL, 
dateIn DATE NOT NULL, 
dateOut DATE, 
comments VARCHAR2(40),
PRIMARY KEY (penNo, petNo, dateIn),
CONSTRAINT PetPenAK UNIQUE (penNo, petNo, dateOut),
CONSTRAINT pennumber FOREIGN KEY (penNo) REFERENCES Pen(penNo),
CONSTRAINT petnumber1 FOREIGN KEY (petNo) REFERENCES Pet(petNo)
);

INSERT INTO PetPen VALUES('p006','pt1111',to_date('4-may-2000','dd-mon-yyyy'),to_date('5-may-
2000','dd-mon-yyyy'),'ok');
INSERT INTO PetPen VALUES('p001','pt1122',to_date('10-feb-2002','dd-mon-yyyy'),to_date('15-feb-
2002','dd-mon-yyyy'),'sad');
INSERT INTO PetPen VALUES('p002','pt1133',to_date('21-dec-2000','dd-mon-yyyy'),to_date('23-dec-
2000','dd-mon-yyyy'),null);
INSERT INTO PetPen VALUES('p003','pt1144',to_date('11-mar-2000','dd-mon-yyyy'),null,'no');
INSERT INTO PetPen VALUES('p001','pt1155',to_date('1-apr-1999','dd-mon-yyyy'),to_date('1-apr-
1999','dd-mon-yyyy'),'ok');
INSERT INTO PetPen VALUES('p006','pt1177',to_date('1-may-2001','dd-mon-yyyy'),to_date('12-may-
2001','dd-mon-yyyy'),'ok');

CREATE TABLE PetTreatment(
examNo CHAR(6) NOT NULL, 
treatNo CHAR(4) NOT NULL, 
startDate DATE NOT NULL, 
endDate DATE NOT NULL, 
quantity NUMBER(4, 1) NOT NULL, 
petComments VARCHAR2(40),
PRIMARY KEY (examNo, treatNo),
CONSTRAINT examnumber FOREIGN KEY (examNo) REFERENCES Examination(examNo),
CONSTRAINT treatnumber FOREIGN KEY (treatNo) REFERENCES Treatment(treatNo)
);

INSERT INTO PetTreatment VALUES('e11111','t001',to_date('1-jan-1999','dd-mon-yyyy'),to_date('1-
jan-1999','dd-mon-yyyy'),2,null);
INSERT INTO PetTreatment VALUES('e11112','t003',to_date('3-feb-2002','dd-mon-yyyy'),to_date('4-
feb-2002','dd-mon-yyyy'),1,null);
INSERT INTO PetTreatment VALUES('e11113','t004',to_date('15-oct-2001','dd-mon-yyyy'),to_date('19-
oct-2001','dd-mon-yyyy'),3,'complicated');
INSERT INTO PetTreatment VALUES('e11111','t002',to_date('20-nov-1998','dd-mon-yyyy'),to_date('21-
nov-1998','dd-mon-yyyy'),1,'minor');
INSERT INTO PetTreatment VALUES('e11114','t009',to_date('7-mar-2001','dd-mon-yyyy'),to_date('7-
mar-2001','dd-mon-yyyy'),1,null);
INSERT INTO PetTreatment VALUES('e11114','t010',to_date('19-apr-2001','dd-mon-yyyy'),to_date('19-
apr-2001','dd-mon-yyyy'),2,null);
INSERT INTO PetTreatment VALUES('e11115','t007',to_date('10-may-1999','dd-mon-yyyy'),to_date('10-
may-1999','dd-mon-yyyy'),1,null);
INSERT INTO PetTreatment VALUES('e11115','t008',to_date('10-may-1999','dd-mon-yyyy'),to_date('10-
may-1999','dd-mon-yyyy'),1,'Perfectly done');

CREATE TABLE Item(
itemNo CHAR(6) NOT NULL, 
itemName VARCHAR2(20) NOT NULL, 
itemDesc VARCHAR2(40) NOT NULL, 
itemCost NUMBER(4, 2) NOT NULL CHECK( itemCost > 0),
PRIMARY KEY (itemNo)
);

set escape '\'
INSERT INTO Item VALUES('s00111','petfood','puppy food',5);
INSERT INTO Item VALUES('s00112','petcan','canned food',10);
INSERT INTO Item VALUES('s00113','slip collar','adjustable collar',15);
INSERT INTO Item VALUES('s00114','fetch \& flash','dog''s toy',25);
INSERT INTO Item VALUES('s00115','eco-flyer','toy',9);
INSERT INTO Item VALUES('s00116','fold-a-bowl','foldable bowl',20);
INSERT INTO Item VALUES('s00117','dog manual','training manual',45);
INSERT INTO Item VALUES('s00118','flint river','treat',19);
INSERT INTO Item VALUES('s00119','natural bone','treat',13);
INSERT INTO Item VALUES('s00120','long haul','dog packs',30);

CREATE TABLE Pharmacy(
drugNo CHAR(3) NOT NULL, 
drugName VARCHAR2(20) NOT NULL, 
drugDesc VARCHAR2(40) NOT NULL, 
dosage VARCHAR2(20) NOT NULL, 
methodAdmin VARCHAR2(20) NOT NULL, 
drugCost NUMBER(4, 2) NOT NULL,
PRIMARY KEY (drugNo)
);

INSERT INTO Pharmacy VALUES('d01','petbelly','For bellyache','200 tablets','2 tablet daily',9);
INSERT INTO Pharmacy VALUES('d02','flea spray','to wash out flea','bottle','daily',5);
INSERT INTO Pharmacy VALUES('d03','bellyworm','to remove threaded worms','50 tablets','1 tablet 
daily',10);
INSERT INTO Pharmacy VALUES('d04','DTPD','rabies','one shot','yearly',15);
INSERT INTO Pharmacy VALUES('d05','HATPA','ear care','bottle','1 spoon/week',30);
INSERT INTO Pharmacy VALUES('d06','appetizer','edible tablets','10 tablets','1 tablet daily',50);

CREATE TABLE ItemClinicStock(
itemNo CHAR(6) NOT NULL, 
clinicNo CHAR(5) NOT NULL, 
inStock NUMBER(6) NOT NULL, 
reorderLevel NUMBER(6) NOT NULL, 
reorderQty NUMBER(6) NOT NULL,
PRIMARY KEY (itemNo, clinicNo),
CONSTRAINT itemnumber FOREIGN KEY (itemNo) REFERENCES Item(itemNo),
CONSTRAINT clinicnumber4 FOREIGN KEY (clinicNo) REFERENCES Clinic(clinicNo)
);

INSERT INTO ItemClinicStock VALUES('s00111','c1111',1,1,5);
INSERT INTO ItemClinicStock VALUES('s00111','c1112',1,1,5);
INSERT INTO ItemClinicStock VALUES('s00111','c1113',1,1,5);
INSERT INTO ItemClinicStock VALUES('s00112','c1111',3,3,5);
INSERT INTO ItemClinicStock VALUES('s00112','c1112',3,3,5);
INSERT INTO ItemClinicStock VALUES('s00112','c1113',3,3,5);
INSERT INTO ItemClinicStock VALUES('s00113','c1111',20,5,50);
INSERT INTO ItemClinicStock VALUES('s00113','c1113',10,5,20);
INSERT INTO ItemClinicStock VALUES('s00114','c1111',20,2,10);
INSERT INTO ItemClinicStock VALUES('s00114','c1112',20,2,10);
INSERT INTO ItemClinicStock VALUES('s00114','c1113',20,2,10);
INSERT INTO ItemClinicStock VALUES('s00115','c1113',5,3,25);

CREATE TABLE PharmClinicStock(
drugNo CHAR(3) NOT NULL, 
clinicNo CHAR(5) NOT NULL,
inStock NUMBER(3) NOT NULL, 
reorderLevel NUMBER(3) NOT NULL, 
reorderQty NUMBER(3) NOT NULL,
PRIMARY KEY (drugNo, clinicNo),
CONSTRAINT drugnumber FOREIGN KEY (drugNo) REFERENCES Pharmacy(drugNo),
CONSTRAINT clinicnumber5 FOREIGN KEY (clinicNo) REFERENCES Clinic(clinicNo)
);

INSERT INTO PharmClinicStock VALUES('d01','c1111',5,2,10);
INSERT INTO PharmClinicStock VALUES('d02','c1113',1,1,20);
INSERT INTO PharmClinicStock VALUES('d03','c1112',9,5,50);
INSERT INTO PharmClinicStock VALUES('d04','c1113',50,10,0);
INSERT INTO PharmClinicStock VALUES('d05','c1112',20,5,0);
INSERT INTO PharmClinicStock VALUES('d06','c1112',4,3,12);
INSERT INTO PharmClinicStock VALUES('d01','c1112',2,3,23);
INSERT INTO PharmClinicStock VALUES('d02','c1112',5,3,100);
INSERT INTO PharmClinicStock VALUES('d04','c1112',3,3,15);

CREATE TABLE Invoice(
invoiceNo CHAR(6) NOT NULL, 
invoiceDate DATE NOT NULL, 
datePaid DATE, 
paymentMethod VARCHAR2(15) NOT NULL, 
ownerNo CHAR(5) NOT NULL, 
examNo CHAR(6) NOT NULL,
PRIMARY KEY (invoiceNo),
CONSTRAINT ownernumber1 FOREIGN KEY (ownerNo) REFERENCES PetOwner(ownerNo),
CONSTRAINT examnumber1 FOREIGN KEY (examNo) REFERENCES Examination(examNo)
);

INSERT INTO Invoice VALUES('i00001',to_date('10-mar-1999','dd-mon-yyyy'),to_date('15-mar-
1999','dd-mon-yyyy'),'check','o1111','e11111');
INSERT INTO Invoice VALUES('i00002',to_date('20-dec-2001','dd-mon-yyyy'),to_date('25-dec-
2001','dd-mon-yyyy'),'credit','o1112','e11112');
INSERT INTO Invoice VALUES('i00003',to_date('18-nov-2001','dd-mon-yyyy'),to_date('5-dec-2001','dd-
mon-yyyy'),'cash','o1113','e11113');
INSERT INTO Invoice VALUES('i00004',to_date('10-jul-2000','dd-mon-yyyy'),to_date('25-jul-
2000','dd-mon-yyyy'),'cash','o1114','e11114');
INSERT INTO Invoice VALUES('i00005',to_date('25-mar-1999','dd-mon-yyyy'),to_date('29-mar-
1999','dd-mon-yyyy'),'credit','o1115','e11115');

CREATE TABLE Appointment(
appNo CHAR(6) NOT NULL, 
appDate DATE NOT NULL, 
appTime NUMBER(4, 2) NOT NULL, 
petNo CHAR(6) NOT NULL,
PRIMARY KEY (appNo),
CONSTRAINT petnumber2 FOREIGN KEY (petNo) REFERENCES Pet(petNo)
);

INSERT INTO Appointment VALUES('a00001',to_date('11-apr-1999','dd-mon-yyyy'),15.20,'pt1111');
INSERT INTO Appointment VALUES('a00002',to_date('21-nov-2001','dd-mon-yyyy'),10.10,'pt1122');
INSERT INTO Appointment VALUES('a00003',to_date('1-oct-2001','dd-mon-yyyy'),9.00,'pt1133');
INSERT INTO Appointment VALUES('a00004',to_date('7-jul-2000','dd-mon-yyyy'),16.30,'pt1144');
INSERT INTO Appointment VALUES('a00005',to_date('10-mar-2002','dd-mon-yyyy'),12.40,'pt1155');

select * from clinic;
select * from staff;
select * from petowner;
select * from pet;
select * from examination;
select * from treatment;
select * from pen;
select * from petpen;
select * from pettreatment;
select * from item;
select * from pharmacy;
select * from itemclinicstock;
select * from pharmclinicstock;
select * from invoice;
select * from appointment;

Update Treatment
SET cost = 10
WHERE treatno = 't004';