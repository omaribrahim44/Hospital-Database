CREATE DATABASE IF NOT EXISTS hospital_db;
USE hospital_db;

-- =========================
-- ROOM
-- =========================
CREATE TABLE Room (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    number_of_beds INT NOT NULL CHECK (number_of_beds > 0)
);

-- =========================
-- STAFF (COMMON STRUCTURE)
-- =========================
CREATE TABLE Receptionist (
    receptionist_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    zip_code INT NOT NULL,
    street VARCHAR(50),
    city VARCHAR(30),
    salary DECIMAL(10,2) NOT NULL,
    gender ENUM('Male','Female') NOT NULL
);

CREATE TABLE Nurse (
    nurse_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    zip_code INT NOT NULL,
    street VARCHAR(50),
    city VARCHAR(30),
    salary DECIMAL(10,2) NOT NULL,
    gender ENUM('Male','Female') NOT NULL
);

CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    zip_code INT NOT NULL,
    street VARCHAR(50),
    city VARCHAR(30),
    salary DECIMAL(10,2) NOT NULL,
    gender ENUM('Male','Female') NOT NULL
);

-- =========================
-- CLINICS & EQUIPMENT
-- =========================
CREATE TABLE Clinic (
    clinic_name VARCHAR(50) PRIMARY KEY,
    doctor_id INT NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

CREATE TABLE Equipment (
    equipment_id INT PRIMARY KEY AUTO_INCREMENT,
    equipment_name VARCHAR(50) NOT NULL,
    equipment_price DECIMAL(10,2) NOT NULL,
    clinic_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (clinic_name) REFERENCES Clinic(clinic_name)
);

-- =========================
-- PATIENT
-- =========================
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    date_of_birth DATE NOT NULL,
    disease VARCHAR(50) NOT NULL,
    zip_code INT NOT NULL,
    street VARCHAR(50),
    city VARCHAR(30),
    gender ENUM('Male','Female') NOT NULL,
    phone_number VARCHAR(15),
    blood_type ENUM('A+','A-','B+','B-','O+','O-','AB+','AB-') NOT NULL,
    room_id INT NOT NULL,
    clinic_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (room_id) REFERENCES Room(room_id),
    FOREIGN KEY (clinic_name) REFERENCES Clinic(clinic_name)
);

-- =========================
-- PAYMENT & BILLING
-- =========================
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    payment_method ENUM('Cash','Credit Card') NOT NULL
);

CREATE TABLE Receipt (
    receipt_id INT PRIMARY KEY AUTO_INCREMENT,
    payment_id INT NOT NULL,
    receptionist_id INT NOT NULL,
    patient_id INT NOT NULL,
    receipt_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (payment_id) REFERENCES Payment(payment_id),
    FOREIGN KEY (receptionist_id) REFERENCES Receptionist(receptionist_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

-- =========================
-- MEDICINE
-- =========================
CREATE TABLE Medicine (
    medicine_id INT PRIMARY KEY AUTO_INCREMENT,
    medicine_name VARCHAR(50) NOT NULL,
    expiry_date DATE NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    doctor_id INT NOT NULL,
    patient_id INT NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

-- =========================
-- RELATION TABLES
-- =========================
CREATE TABLE Doctor_Nurse (
    doctor_id INT NOT NULL,
    nurse_id INT NOT NULL,
    PRIMARY KEY (doctor_id, nurse_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (nurse_id) REFERENCES Nurse(nurse_id)
);

CREATE TABLE Nurse_Room (
    nurse_id INT NOT NULL,
    room_id INT NOT NULL,
    PRIMARY KEY (nurse_id, room_id),
    FOREIGN KEY (nurse_id) REFERENCES Nurse(nurse_id),
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);

CREATE TABLE Doctor_Patient (
    doctor_id INT NOT NULL,
    patient_id INT NOT NULL,
    PRIMARY KEY (doctor_id, patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

-- =========================
-- INDEXES (PERFORMANCE)
-- =========================
CREATE INDEX idx_patient_clinic ON Patient(clinic_name);
CREATE INDEX idx_patient_room ON Patient(room_id);
CREATE INDEX idx_receipt_patient ON Receipt(patient_id);
