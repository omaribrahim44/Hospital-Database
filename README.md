# Hospital Database Management System

This project implements a relational hospital database using MySQL, designed to model real-world hospital operations such as patient management, staff organization, clinics, billing, and medical records.

## Project Objectives
- Design a normalized relational database based on hospital business requirements
- Enforce data integrity using primary keys, foreign keys, and constraints
- Implement the schema using MySQL SQL statements
- Demonstrate database interaction through a simple front-end interface

## Database Features
- Patient, Doctor, Nurse, and Receptionist management
- Clinic and medical equipment tracking
- Patient-room assignments
- Doctor–Patient and Doctor–Nurse relationships
- Payment and receipt handling
- Medicine prescriptions linked to doctors and patients

## Technologies Used
- MySQL
- SQL (DDL & DML)
- Relational Database Design
- Python (GUI interaction)

## Database Design Concepts
- Normalized schema (3NF)
- Many-to-many relationships using junction tables
- Enforced referential integrity
- Indexed foreign keys for better query performance

## Graphical User Interface (GUI)
A simple Python-based GUI was developed using Tkinter to interact with the MySQL hospital database.

### GUI Features
- Display records from all major tables dynamically
- Insert new doctor records through a form-based interface
- Automatic column detection per table
- Real-time data refresh after insertion
- Error handling for database operations

### Technologies Used
- Python
- Tkinter
- MySQL Connector
