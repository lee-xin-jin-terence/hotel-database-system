# 📚 Hotel Management Database System

## 📌 Project Overview

This project models a relational **Hotel Management Database System** that captures relationships between hotels, rooms, bookings, guests, and payments. The schema is designed to be portable and has been implemented in multiple SQL dialects, including:

- SQL Server  
- MySQL  
- Oracle  
- PostgreSQL  
- SQLite  

The system demonstrates fundamental database design principles such as entity-relationship modeling, data dictionary creation, SQL schema implementation, and sample data population.

## 🎯 Objectives

- Design a normalized relational database schema for a hotel management system.  
- Implement and maintain compatible schemas across five major SQL database systems.  
- Track room bookings with detailed check-in and check-out dates and booking statuses.  
- Manage guests with their contact details and associate them with bookings.  
- Record payment transactions linked to bookings, including payment methods and statuses.  
- Provide comprehensive documentation including a data dictionary, sample data, and example queries.  

## 🗂️ System Features

- Each **hotel** has multiple rooms available for booking.  
- Each **room**:  
  - Belongs to one hotel only.  
  - Has attributes including room number, type, capacity, and price per night.  
- Each **booking**:  
  - Is associated with one room.  
  - Records check-in and check-out dates, booking date, and booking status.  
- Each **guest**:  
  - Has personal and contact information stored.  
  - Can be associated with multiple bookings through a join table.  
- The **BookingGuest** join table manages many-to-many relationships between bookings and guests, including the designation of a primary guest.  
- Each **payment**:  
  - Is linked to one booking.  
  - Includes payment date, amount, method, and status.  

## 📈 Database Modelling (Entity-Relationship Diagram)
![hotel-database-system drawio (3)](https://github.com/user-attachments/assets/33d09f19-1ca5-481b-b789-aa8dc83eea8b)
  

## 📁 Project Structure

```plaintext
hotel-database-system/
│
├── sql/
│   ├── sql_server/
│       ├── schema
│       ├── data
│       ├── queries
│       ├── data_dictionary.md
│ 
│   ├── oracle/
│       ├── (same subfolder structure as sql_server)
│ 
│   ├── postgresql/
│       ├── (same subfolder structure as sql_server)
│ 
│   ├── mysql/
│       ├── (same subfolder structure as sql_server)
│ 
│   └── sqlite/
│       ├── (same subfolder structure as sql_server)
│
└── README.md
