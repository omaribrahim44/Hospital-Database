create database project;
use project;

show tables;

create table Room (
	Room_number int primary key,
    Numbers_of_beds int not null
);

insert into room values (1,3);
insert into room value (2,2);
insert into room values (3,5);

create table Receptionist (
	Receptionist_ID int primary key ,
    First_name varchar(20) not null,
    Last_name varchar(20) not null,
    Zip_number int not null,
    Street varchar (20),
    city varchar(20),
    Salary int not null,
    Gender varchar(20) not null
);

insert into Receptionist values (1,'Yussef','Elrakaipy',11517,'omar elngomy','Alex','5400','Male');
insert into Receptionist (Receptionist_ID,First_name,Last_name,Zip_number,city,Salary,Gender) 
	values(2,'Omar','Ebrahim',11550,'Cairo',7000,'Male'); 
insert into Receptionist (Receptionist_ID,First_name,Last_name,Zip_number,Salary,Gender) 
	values(3,'Rewan','Ali',11595,5000,'Female');     

create table Payment (
	Payment_ID int primary key,
    Cridit_cards varchar(3) not null,
    Cash varchar (3) not null
);

insert into payment values (1,'Yes','No');
insert into payment values (2,'No','Yes');
insert into payment values (3,'Yes','No');

create table Nurse (
	Nurse_ID int primary key ,
    First_name varchar(20) not null,
    Last_name varchar(20) not null,
    Zip_number int not null,
    Street varchar (20),
    city varchar(20),
    Salary int not null,
    Gender varchar(20) not null
);

insert into nurse values (1,'Ali','Mohamed',11542,'omar elngomy','Cairo','8450','Male');
insert into nurse (nurse_ID,First_name,Last_name,Zip_number,city,Salary,Gender) 
	values(2,'Seif','Karam',1150,'Alex',6000,'Male');
insert into nurse (nurse_ID,First_name,Last_name,Zip_number,Salary,Gender) 
	values(3,'Shahd','Tamer',11585,9500,'Female');    

create table Doctor (
	Doctor_ID int primary key,
    First_name varchar(20) not null,
    Last_name varchar(20) not null,
    Zip_number int not null,
    Street varchar (20),
    city varchar(20),
    Salary int not null,
    Gender varchar(20) not null
);

insert into Doctor values (1,'abdelrahman','mohamed',11520,'GG','Alex',17000,'Male');
insert into Doctor (doctor_id,first_name,last_name,zip_number,salary,gender)
	values (2,'Marwan','Khalaf',11580,15500,'Male');
insert into Doctor (doctor_id,first_name,last_name,zip_number,city,salary,gender)
	values (3,'Adham','Abdallah',11571,'Giza',16700,'Male');    

create table Clinics (
	Clinics_name varchar(50) primary key,
    Doctor_ID int not null, 
    foreign key (Doctor_ID) references Doctor(Doctor_ID)
);

insert into Clinics values ('Cardiology',1);
insert into Clinics values('Internal Medicine',2);
insert into Clinics values('oncology',3);

create table Equipment (
	Equipment_ID int primary key,
    Equipment_name varchar (20) not null,
    Equipment_price int not null,
    Clinics_name varchar(50) not null,
    foreign key (Clinics_name) references Clinics (Clinics_name)

);

insert into Equipment values (1,'Surgical Needles',1200,'Cardiology');
insert into Equipment values (2,'Retractors',1000,'Internal Medicine');
insert into Equipment values (3,'Surgical Hook',750,'oncology');
    
create table Patient (
	Patient_ID int primary key,
    First_name varchar(20) not null,
    Last_name varchar(20) not null,
    date_of_birth date not null,
    Diseases varchar (40) not null,
    Zip_number int not null,
    Street varchar (20),
    city varchar(20),
    Gender varchar(20) not null,
    Phone_number int,
    Blood_type varchar (5) not null,
    Room_number int not null,
    Clinics_name varchar(50) not null,
	foreign key (Clinics_name) references Clinics (Clinics_name),
    foreign key (Room_number) references Room (Room_number)
);

insert into patient values ('1','Jo','Ali','2004-8-1','Gastritis',11517,'GG','Giza','Male',123456,'A+',1,'Internal Medicine');
insert into patient (patient_ID,first_name,Last_name,date_of_birth,Diseases,Zip_number,Gender,Blood_type,room_number,Clinics_name)
	values (2,'rana','ahmed','1975-5-4','Constipation',11675,'Female','O+',2,'oncology');
insert into patient (patient_ID,first_name,Last_name,date_of_birth,Diseases,Zip_number,city,Gender,Blood_type,Phone_number,room_number,Clinics_name)
	values (3,'Ahmed','Reda','2000-12-7','Appendicitis',11542,'Sina','Male','B-',175465,2,'Cardiology');
    
create table Receipt (
	 Receipt_ID int primary key,
    Payment_ID int not null,
    Receptionist_ID int not null,
    Patient_ID int not null,
    foreign key (Payment_ID) references Payment(Payment_ID),
    foreign key (Receptionist_ID) references Receptionist(Receptionist_ID),
    foreign key (Patient_ID) references Patient(Patient_ID)
);

insert into  Receipt values (1,2,1,3);
insert into  Receipt values (2,1,3,1);
insert into  Receipt values (3,2,2,2);   

create table Medicine (
	Medicine_name varchar(40) primary key,
    Expiry_date date not null,
    Price int not null,
    Doctor_ID int not null,
	Patient_ID int not null,
	foreign key (Patient_ID) references Patient(Patient_ID),
	foreign key (Doctor_ID) references Doctor(Doctor_ID)
);

insert into Medicine values ('Entresto','2030-12-1','1200',1,2);
insert into Medicine values ('Lipitor','2035-11-25',250,3,2);
insert into Medicine values ('Glucophage XR','2027-10-15',75,2,1);
insert into Medicine values ('Panadol','2040-1-13',30.5,1,3);    

create table Doctor_Nurse(
	Doctor_ID int not null,
    Nurse_ID int not null,
	primary key (Nurse_ID, Doctor_ID),
    foreign key (Nurse_ID) references Nurse (Nurse_ID),
    foreign key (Nurse_ID) references Nurse (Nurse_ID)
);

insert into Doctor_Nurse values (1,2);
insert into Doctor_Nurse values (2,3);
insert into Doctor_Nurse values (2,1);

create table Nurse_Room(
	Nurse_ID int not null,
    Room_number int not null,
     primary key (Nurse_ID, Room_number),
     foreign key (Room_number) references Room (Room_number),
     foreign key (Nurse_ID) references Nurse (Nurse_ID)
);

insert into Nurse_Room values (2,1);
insert into Nurse_Room values (1,3);
insert into Nurse_Room values (3,2);

create table Doctor_Patient (
    Doctor_ID int not null,
    Patient_ID int not null,
    primary key (Doctor_ID, Patient_ID),
     foreign key (Patient_ID) references Patient(Patient_ID),
     foreign key (Doctor_ID) references Doctor(Doctor_ID)
);

insert into Doctor_Patient values (1,3);
insert into Doctor_Patient values (3,1);
insert into Doctor_Patient values (2,2);


select* from Doctor_Patient;
select* from Nurse_Room;
select*  from Doctor_Nurse;
select* from Medicine;    
select* from Bill;
select* from doctor;
select* from patient;
select*  from Equipment;
select* from nurse;
select* from Clinics;
select* from payment; 
select* from Receptionist;
select* from room;