# SQLite Data Dictionary for Hotel Database

This document describes the schema for the SQLite implementation of the hotel database system. It includes tables, columns, data types, constraints, and descriptions.

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

| Column Name    | Data Type       | Constraints             | Description                   |
|----------------|-----------------|-------------------------|-------------------------------|
| `hotelId`      | `INTEGER`        | PRIMARY KEY, AUTOINCREMENT | Unique ID for each hotel       |
| `name`         | `TEXT`           | NOT NULL                | Hotel name                    |
| `address`      | `TEXT`           | NULL                    | Hotel physical address        |
| `phoneNumber`  | `TEXT`           | NULL                    | Contact phone number          |
| `emailAddress` | `TEXT`           | NULL                    | Contact email address         |

---

## 📌 Table: `Room`

Stores details about rooms within a hotel.

| Column Name    | Data Type       | Constraints                          | Description                                  |
|----------------|-----------------|------------------------------------|----------------------------------------------|
| `roomId`       | `INTEGER`       | PRIMARY KEY, AUTOINCREMENT          | Unique ID for each room                       |
| `hotelId`      | `INTEGER`       | NOT NULL, FOREIGN KEY → `Hotel(hotelId)` | Hotel to which this room belongs              |
| `roomNumber`   | `TEXT`          | NULL                              | Room number or identifier                     |
| `roomType`     | `TEXT`          | NULL                              | Type/category of room (e.g., Single, Suite)  |
| `capacity`     | `INTEGER`       | CHECK (capacity > 0)               | Maximum occupancy                             |
| `pricePerNight`| `REAL`          | CHECK (pricePerNight >= 0)         | Cost per night stay                           |

---

## 📌 Table: `Booking`

Records booking details for rooms.

| Column Name      | Data Type       | Constraints                         | Description                                   |
|------------------|-----------------|-----------------------------------|-----------------------------------------------|
| `bookingId`      | `INTEGER`       | PRIMARY KEY, AUTOINCREMENT          | Unique ID for each booking                      |
| `roomId`         | `INTEGER`       | NOT NULL, FOREIGN KEY → `Room(roomId)` | Room being booked                               |
| `checkingInDate` | `DATE`          | NULL                              | Guest check-in date                             |
| `checkingOutDate`| `DATE`          | NULL                              | Guest check-out date                            |
| `bookingDate`    | `DATE`          | DEFAULT (DATE('now'))             | Date booking was made                           |
| `status`         | `TEXT`          | NULL                              | Booking status (e.g., Confirmed, Cancelled)    |

---

## 📌 Table: `Guest`

Stores personal information about guests.

| Column Name    | Data Type       | Constraints            | Description                 |
|----------------|-----------------|------------------------|-----------------------------|
| `guestId`      | `INTEGER`       | PRIMARY KEY, AUTOINCREMENT | Unique ID for each guest     |
| `firstName`    | `TEXT`          | NULL                   | Guest's first name           |
| `lastName`     | `TEXT`          | NULL                   | Guest's last name            |
| `phoneNumber`  | `TEXT`          | NULL                   | Guest contact number         |
| `emailAddress` | `TEXT`          | NULL                   | Guest email address          |
| `address`      | `TEXT`          | NULL                   | Guest postal address         |

---

## 📌 Table: `BookingGuest`

Join table linking guests to bookings.

| Column Name       | Data Type       | Constraints                          | Description                                           |
|-------------------|-----------------|------------------------------------|-------------------------------------------------------|
| `bookingGuestId` | `INTEGER`       | PRIMARY KEY, AUTOINCREMENT          | Unique ID for each booking-guest association          |
| `bookingId`      | `INTEGER`       | NOT NULL, FOREIGN KEY → `Booking(bookingId)` | Associated booking                                    |
| `guestId`        | `INTEGER`       | NOT NULL, FOREIGN KEY → `Guest(guestId)`     | Associated guest                                      |
| `isPrimary`      | `INTEGER`       | NULL                              | Indicates if guest is the primary guest (0 or 1)      |

---

## 📌 Table: `Payment`

Records payment transactions for bookings.

| Column Name      | Data Type        | Constraints                          | Description                                     |
|------------------|------------------|------------------------------------|-------------------------------------------------|
| `paymentId`      | `INTEGER`       | PRIMARY KEY, AUTOINCREMENT          | Unique ID for each payment                       |
| `bookingId`      | `INTEGER`       | NOT NULL, FOREIGN KEY → `Booking(bookingId)` | Booking the payment is for                        |
| `paymentDate`    | `DATE`          | DEFAULT (DATE('now'))               | Date the payment was made                         |
| `amount`         | `REAL`          | CHECK (amount >= 0)                 | Amount paid                                      |
| `paymentMethod`  | `TEXT`          | NULL                              | Method of payment (e.g., Credit Card, Cash)      |
| `status`         | `TEXT`          | NULL                              | Payment status (e.g., Completed, Pending, Failed)|

---
