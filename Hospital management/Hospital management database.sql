drop table Bill;
drop table Take_care;
drop table Nurse;
drop table Test;
drop table Consult;
drop table Room;
drop table Patient;
drop table Doctor;
drop table Building;
DROP TABLE Hospital;

CREATE TABLE Hospital(
	h_id Number(30) NOT NULL,
	h_name varchar(20),
	City varchar(20),
	Street varchar(20),
	PRIMARY KEY (h_id)	
);
CREATE TABLE Building(
	building_no Number(20),
	building_name varchar(50),
	h_id Number(30) NOT NULL,
	PRIMARY KEY (building_no),
	FOREIGN KEY (h_id) REFERENCES Hospital (h_id) ON DELETE CASCADE
);

CREATE TABLE Doctor(
	d_id Number (20) NOT NULL,
	h_id Number(30) NOT NULL,
	d_name varchar(50),
	designation varchar(40),
	dept varchar(20),
	PRIMARY KEY (d_id),
	FOREIGN KEY (h_id) REFERENCES Hospital(h_id) ON DELETE CASCADE
);
CREATE TABLE Patient(
	p_id Number(20) NOT NULL,
	p_name varchar(20),
	gender varchar(20),
	phone Number(20),
	deseases varchar(20),
	PRIMARY key (p_id)	
);
CREATE TABLE Room(
	building_no varchar(20) NOT NULL,
	room_no varchar(10) NOT NULL,
	p_id Number(20) NOT NULL,
	room_type varchar(20),
	status varchar(20),
	PRIMARY key (building_no,room_no),
	FOREIGN key (p_id) REFERENCES Patient (p_id) ON DELETE CASCADE
);
CREATE TABLE Consult(
	d_id Number(20) NOT NULL,
	p_id Number(20) NOT NULL,
	PRIMARY key (d_id,p_id),
	FOREIGN key (d_id) REFERENCES Doctor (d_id) ON DELETE CASCADE,
	FOREIGN KEY (p_id) REFERENCES Patient (p_id) ON DELETE CASCADE
);
CREATE TABLE Test(
	t_id Number(20) NOT NULL,
	p_id Number(20) NOT NULL,
	d_id Number(20) NOT NULL,
	t_name varchar(20),
	cost varchar(20),
	PRIMARY key (t_id),
	FOREIGN key (p_id) REFERENCES Patient (p_id) ON DELETE CASCADE,	
	FOREIGN KEY (d_id) REFERENCES Doctor (d_id) ON DELETE CASCADE
);
CREATE TABLE Nurse(
	n_id Number(20) NOT NULL,
	n_name varchar(50),
	n_phone Number(20),
	shift varchar(16),
	PRIMARY key (n_id)	
);
CREATE TABLE Take_care(
	p_id Number(20) NOT NULL,
	n_id Number(20) NOT NULL,
	PRIMARY key (p_id,n_id),
	FOREIGN key (p_id) REFERENCES Patient (p_id) ON DELETE CASCADE,
	FOREIGN KEY (n_id) REFERENCES Nurse (n_id)	ON DELETE CASCADE
);
CREATE TABLE Bill(
	b_id Number(20) NOT NULL,
	p_id Number(20),
	biller_name varchar(25),
	bill_date date,
	ammount varchar(25),
	PRIMARY key (b_id),
	FOREIGN key (p_id) REFERENCES Patient (p_id) ON DELETE CASCADE	
);























