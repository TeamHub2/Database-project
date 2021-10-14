DROP TABLE consult;
DROP TABLE take_care;
DROP TABLE room;
DROP TABLE bill;
DROP TABLE test;
DROP TABLE nurse;
DROP TABLE patient;
DROP TABLE doctor;
DROP TABLE building;
DROP TABLE hospital;


CREATE TABLE hospital(
h_id number(10) NOT NULL,
h_name varchar(30),
City varchar(20),
Street varchar(20),
PRIMARY KEY (h_id)
);

CREATE TABLE building(
building_no number(10) NOT NULL,
h_id number(10) NOT NULL,
building_name varchar(30),
PRIMARY KEY(building_no),
FOREIGN KEY(h_id) REFERENCES hospital(h_id) on DELETE CASCADE
);

CREATE TABLE doctor(
d_id number(10) NOT NULL,
h_id number(10) NOT NULL,
d_name varchar(30),
designation varchar(30),
dept varchar(30),
PRIMARY KEY(d_id),
FOREIGN KEY(h_id) REFERENCES hospital(h_id) ON DELETE CASCADE
);

CREATE TABLE patient(
p_id number(10) NOT NULL,
p_name varchar(30),
gender varchar(20),
phone varchar(15),
diseases varchar(30),
PRIMARY KEY(p_id)	
);

CREATE TABLE nurse(
n_id number(10) NOT NULL,
n_name varchar(30),
n_phone varchar(15),
shift varchar(15),
PRIMARY KEY(n_id)	
);

CREATE TABLE test(
t_id number(10) NOT NULL,
p_id number(10) NOT NULL,
d_id number(10) NOT NULL,
t_name varchar(30),
cost varchar(10),
PRIMARY KEY(t_id),
FOREIGN KEY(p_id) REFERENCES patient(p_id) ON DELETE CASCADE,	
FOREIGN KEY(d_id) REFERENCES doctor(d_id) ON DELETE CASCADE
);

CREATE TABLE bill(
b_id number(10) NOT NULL,
p_id number(10) NOT NULL,
biller_name varchar(30),
bill_date date,
ammount varchar(20),
PRIMARY KEY(b_id),
FOREIGN KEY(p_id) REFERENCES patient(p_id) ON DELETE CASCADE
);

CREATE TABLE room(
building_no number(10) NOT NULL,
room_no number(10) NOT NULL,
p_id number(10) NOT NULL,
room_type varchar(20),
status varchar(20),
PRIMARY KEY(building_no,room_no),
FOREIGN KEY(p_id) REFERENCES patient(p_id) ON DELETE CASCADE
);

CREATE TABLE consult(
d_id number(10) NOT NULL,
p_id number(10) NOT NULL,
PRIMARY KEY(d_id,p_id),
FOREIGN KEY(d_id) REFERENCES doctor(d_id) ON DELETE CASCADE,
FOREIGN KEY(p_id) REFERENCES patient(p_id) ON DELETE CASCADE
);

CREATE TABLE take_care(
p_id number(10) NOT NULL,
n_id number(10)NOT NULL,
PRIMARY KEY(p_id,n_id),
FOREIGN KEY(p_id) REFERENCES patient(p_id) ON DELETE CASCADE,
FOREIGN KEY(n_id) REFERENCES nurse(n_id)	ON DELETE CASCADE
);





INSERT INTO hospital VALUES (2101,'JKG Hospital','Dhaka', 'Shamoly') ;
INSERT INTO hospital VALUES (2102,'DMC Hospital','Dhaka', 'Shahbagh') ;
INSERT INTO hospital VALUES (2103,'Rejent Hospital','Dhaka', 'Mirpur 12');
INSERT INTO hospital VALUES (2105,'JKG Hospital','Dhaka', 'Uttara') ;
INSERT INTO hospital VALUES (2106,'SMC Hospital','Dhaka', 'College Gate') ;
INSERT INTO hospital VALUES (2107,'Mugdha Hospital','Dhaka', 'Mugdha A2') ;


INSERT INTO building VALUES (182,2101,'Emergency Building') ;
INSERT INTO building VALUES (183,2102,'Cardiac Building') ;
INSERT INTO building VALUES (184,2101,'General Building') ;
INSERT INTO building VALUES (185,2105,'Kidny dialysis Building') ;
INSERT INTO building VALUES (186,2105,'EYE Building') ;
INSERT INTO building VALUES (187,2106,'Dental Building') ;
INSERT INTO building VALUES (188,2107,'Pediatric Building') ;
INSERT INTO building VALUES (189,2107,'Diabetes Building') ;


INSERT INTO doctor VALUES (171,2101,'DR.Rishad Amin Pulok','Professor of Medicine','Medicine') ;
INSERT INTO doctor VALUES (175,2101,'DR.Nasrin Akter Borsha','Professor of Medicine','Medicine') ;
INSERT INTO doctor VALUES (176,2105,'DR.Sazidur Rahaman','Assoiciate Professor','Orthopedic surgery') ;
INSERT INTO doctor VALUES (177,2106,'DR.Najuya Akter Mim','Medical officer','Cardiology') ;
INSERT INTO doctor VALUES (172,2107,'DR.Abdullah All Shaikat','Medical officer','Neurology') ;
INSERT INTO doctor VALUES (179,2103,'DR.Sefatullah','Medical officer','Neurology') ;
INSERT INTO doctor VALUES (178,2106,'DR.Rishad ','Professor of Medicine','Ophthalmology') ;
INSERT INTO doctor VALUES (174,2107,'DR.Sakib','Professor of Medicine','Ophthalmology') ;
INSERT INTO doctor VALUES (173,2102,'DR.Sabrina Akter','Assoiciate Professor','Orthopedic surgery') ;


INSERT INTO patient VALUES (101,'Sabrina Akter','Female','01788794828','Fever') ;
INSERT INTO patient VALUES (102,'Sakib','Male','01788794666','Fever') ;
INSERT INTO patient VALUES (103,'Anika Akter','Female','01788794555','Cancer') ;
INSERT INTO patient VALUES (105,'Sajjad ','Male','01788794333','Gastrick') ;
INSERT INTO patient VALUES (106,'Borsha Akter','Female','01788794222','Back pain') ;
INSERT INTO patient VALUES (107,'Jannati Akter','Female','01788794363','Fever') ;
INSERT INTO patient VALUES (108,'Rimon','Male','01788794333','Alergy') ;
INSERT INTO patient VALUES (109,'Rfat','Male','01788794353','Headache') ;
INSERT INTO patient VALUES (110,'Ibrahim','Male','01788791333','Diabetes') ;


INSERT INTO nurse VALUES (161,'Mrs.Sumaiya Jannati','01722334455','Day') ;
INSERT INTO nurse VALUES (162,'Mrs.Sabiha Jannati','01722664455','Night') ;
INSERT INTO nurse VALUES (163,'Mrs.Nabila Akter','01722994455','Day') ;
INSERT INTO nurse VALUES (164,'Mrs.Salaya','01722114455','Night') ;
INSERT INTO nurse VALUES (165,'Mrs.Sadia','01722004455','Evening') ;
INSERT INTO nurse VALUES (166,'Mrs.Afroja Akter','01722774455','Day') ;
INSERT INTO nurse VALUES (167,'Mrs.Bilkis Begum','01722994455','Evening') ;
INSERT INTO nurse VALUES (168,'Mrs.Hafsa Akter','01722124455','Night') ;
INSERT INTO nurse VALUES (169,'Mrs.Israt Jahan','01722134455','Evening') ;


INSERT INTO test VALUES (1,101,171,'Blood test','250') ;
INSERT INTO test VALUES (2,101,171,'X_Ray','500') ;
INSERT INTO test VALUES (3,102,172,'COVIT test','2000') ;
INSERT INTO test VALUES (4,103,173,'COVIT test','2000') ;
INSERT INTO test VALUES (5,105,174,'Blood test','250') ;
INSERT INTO test VALUES (6,102,172,'COVIT test','2000') ;
INSERT INTO test VALUES (7,103,173,'COVIT test','2000') ;
INSERT INTO test VALUES (8,105,175,'Kidny function test','80000') ;
INSERT INTO test VALUES (9,106,176,'Syphilis test','100000') ;
INSERT INTO test VALUES (10,107,177,'Toxicology test','12000') ;
INSERT INTO test VALUES (11,106,176,'Blood test','250') ;
INSERT INTO test VALUES (12,108,178,'Serological test','6000') ;
INSERT INTO test VALUES (13,109,179,'Blood test','250') ;
INSERT INTO test VALUES (14,110,177,'kidny function test','8000') ;
INSERT INTO test VALUES (15,109,175,'Liver function test','13000') ;


INSERT INTO bill VALUES (201,101,'Pulok','22-APR-2020','150000');
INSERT INTO bill VALUES (202,102,'Rafiq','21-May-2020','10000');
INSERT INTO bill VALUES (203,103,'Salaya','12-APR-2020','50000');
INSERT INTO bill VALUES (204,110,'Hamid','15-APR-2020','50000');
INSERT INTO bill VALUES (205,105,'Rasel','11-Jun-2020','10000');
INSERT INTO bill VALUES (206,106,'Hanif','22-APR-2020','50000');
INSERT INTO bill VALUES (207,107,'Belal','5-July-2020','15000');
INSERT INTO bill VALUES (208,102,'Ratul','22-Aug-2020','120000');
INSERT INTO bill VALUES (209,108,'Sumi','11-APR-2020','10000');                  
INSERT INTO bill VALUES (210,109,'Pranto','16-APR-2020','50000');          
INSERT INTO bill VALUES (211,108,'Skib','17-APR-2020','70000');
INSERT INTO bill VALUES (212,110,'Prema','27-APR-2020','90000');
INSERT INTO bill VALUES (213,103,'Partho','10-APR-2020','60000');
INSERT INTO bill VALUES (214,105,'Shikto','12-APR-2020','20000');
INSERT INTO bill VALUES (215,106,'Afroja','1-Jan-2020','80000');


INSERT INTO room VALUES (182,3001,101,'A','High') ;
INSERT INTO room VALUES (185,3002,102,'B','High') ;
INSERT INTO room VALUES (183,3003,105,'C','Low') ;
INSERT INTO room VALUES (184,3004,101,'D','High') ;
INSERT INTO room VALUES (185,3005,103,'A','High') ;
INSERT INTO room VALUES (186,3006,102,'C','Low') ;
INSERT INTO room VALUES (187,3007,105,'D','High') ;
INSERT INTO room VALUES (189,3008,106,'B','Low') ;
INSERT INTO room VALUES (182,4001,107,'A','High') ;
INSERT INTO room VALUES (183,4002,108,'C','Low') ;
INSERT INTO room VALUES (184,4009,109,'B','High') ;
INSERT INTO room VALUES (185,4005,110,'D','Low') ;


INSERT INTO consult VALUES (171,101);
INSERT INTO consult VALUES (172,102);
INSERT INTO consult VALUES (173,103);
INSERT INTO consult VALUES (174,105);
INSERT INTO consult VALUES (175,106);
INSERT INTO consult VALUES (176,106);
INSERT INTO consult VALUES (177,107);
INSERT INTO consult VALUES (178,108);
INSERT INTO consult VALUES (179,110);
INSERT INTO consult VALUES (173,102);
INSERT INTO consult VALUES (174,103);
INSERT INTO consult VALUES (174,106);


INSERT INTO take_care VALUES (101,161);
INSERT INTO take_care VALUES (110,162);
INSERT INTO take_care VALUES (103,163);
INSERT INTO take_care VALUES (102,164);
INSERT INTO take_care VALUES (103,165);
INSERT INTO take_care VALUES (102,166);
INSERT INTO take_care VALUES (105,167);
INSERT INTO take_care VALUES (105,168);
INSERT INTO take_care VALUES (106,169);
INSERT INTO take_care VALUES (106,161);
INSERT INTO take_care VALUES (107,167);
INSERT INTO take_care VALUES (108,162);
INSERT INTO take_care VALUES (109,163);
