# MySQL Data Dictionary for Hotel Database

This document describes the schema for the MySQL implementation of the hotel database system. It includes tables, columns, data types, constraints, and descriptions.

_Last updated: 2025-06-02_

---

## 📋 Table Overview

| Table Name       | Description                                                       |
|------------------|-------------------------------------------------------------------|
| `Hotel`          | Stores information about hotels.                                 |
| `Room`           | Stores details of rooms within hotels, including type and price. |
| `Booking`        | Records room bookings, dates, and booking status.                 |
| `Guest`          | Stores personal details of guests.                               |
| `BookingGuest`   | Join table associating guests with bookings, marking primary guest.|
| `Payment`        | Records payments made for bookings, including amount and status. |

---

## 📌 Table: `Hotel`

Stores basic information about hotels.

| Column Name    | Data Type         | Constraints             | Description                   |
|----------------|-------------------|-------------------------|-------------------------------|
| `hotelId`      | `INT`            | PRIMARY KEY, AUTO_INCREMENT | Unique ID for each hotel       |
| `name`         | `VARCHAR(100)`    | NOT NULL                | Hotel name                    |
| `address`      | `VARCHAR(255)`    | NULL                    | Hotel physical address        |
| `phoneNumber`  | `VARCHAR(20)`     | NULL                    | Contact phone number          |
| `emailAddress` | `VARCHAR(100)`    | NULL                    | Contact email address         |

---

## 📌 Table: `Room`

Stores details about rooms within a hotel.

| Column Name    | Data Type         | Constraints                              | Description                                  |
|----------------|-------------------|----------------------------------------|----------------------------------------------|
| `roomId`       | `INT`            | PRIMARY KEY, AUTO_INCREMENT              | Unique ID for each room                       |
| `hotelId`      | `INT`            | NOT NULL, FOREIGN KEY → `Hotel(hotelId)` | Hotel to which this room belongs              |
| `roomNumber`   | `VARCHAR(20)`    | NULL                                  | Room number or identifier                     |
| `roomType`     | `VARCHAR(50)`    | NULL                                  | Type/category of room (e.g., Single, Suite)  |
| `capacity`     | `INT`            | CHECK (capacity > 0)                   | Maximum occupancy                             |
| `pricePerNight`| `DECIMAL(10, 2)` | CHECK (pricePerNight >= 0)             | Cost per night stay                           |

---

## 📌 Table: `Booking`

Records booking details for rooms.

| Column Name      | Data Type         | Constraints                               | Description                                   |
|------------------|-------------------|------------------------------------------|-----------------------------------------------|
| `bookingId`      | `INT`            | PRIMARY KEY, AUTO_INCREMENT                | Unique ID for each booking                      |
| `roomId`         | `INT`            | NOT NULL, FOREIGN KEY → `Room(roomId)`   | Room being booked                               |
| `checkingInDate` | `DATE`           | NOT NULL                                 | Guest check-in date                             |
| `checkingOutDate`| `DATE`           | NULL                                    | Guest check-out date                            |
| `bookingDate`    | `DATE`           | NOT NULL                                 | Date booking was made                           |
| `status`         | `VARCHAR(50)`    | NOT NULL                                 | Booking status (e.g., Confirmed, Cancelled)    |

---

## 📌 Table: `Guest`

Stores personal information about guests.

| Column Name    | Data Type         | Constraints            | Description                 |
|----------------|-------------------|------------------------|-----------------------------|
| `guestId`      | `INT`            | PRIMARY KEY, AUTO_INCREMENT | Unique ID for each guest     |
| `firstName`    | `VARCHAR(50)`    | NULL                   | Guest's first name           |
| `lastName`     | `VARCHAR(50)`    | NULL                   | Guest's last name            |
| `phoneNumber`  | `VARCHAR(20)`    | NULL                   | Guest contact number         |
| `emailAddress` | `VARCHAR(100)`   | NULL                   | Guest email address          |
| `address`      | `VARCHAR(255)`   | NULL                   | Guest postal address         |

---

## 📌 Table: `BookingGuest`

Join table linking guests to bookings.

| Column Name       | Data Type         | Constraints                              | Description                                           |
|-------------------|-------------------|----------------------------------------|-------------------------------------------------------|
| `bookingGuestId` | `INT`            | PRIMARY KEY, AUTO_INCREMENT              | Unique ID for each booking-guest association          |
| `bookingId`      | `INT`            | NOT NULL, FOREIGN KEY → `Booking(bookingId)` | Associated booking                                    |
| `guestId`        | `INT`            | NOT NULL, FOREIGN KEY → `Guest(guestId)`     | Associated guest                                      |
| `isPrimary`      | `TINYINT(1)`     | NULL                                    | Indicates if guest is the primary guest (0 or 1)      |

---

## 📌 Table: `Payment`

Records payment transactions for bookings.

| Column Name      | Data Type         | Constraints                               | Description                                     |
|------------------|-------------------|-------------------------------------------|-------------------------------------------------|
| `paymentId`      | `INT`            | PRIMARY KEY, AUTO_INCREMENT                 | Unique ID for each payment                       |
| `bookingId`      | `INT`            | NOT NULL, FOREIGN KEY → `Booking(bookingId)` | Booking the payment is for                        |
| `paymentDate`    | `DATE`           | NOT NULL                                  | Date the payment was made                         |
| `amount`         | `DECIMAL(10, 2)` | CHECK (amount >= 0)                        | Amount paid                                      |
| `paymentMethod`  | `VARCHAR(50)`    | NULL                                      | Method of payment (e.g., Credit Card, Cash)      |
| `status`         | `VARCHAR(50)`    | NULL                                      | Payment status (e.g., Completed, Pending, Failed)|

---
