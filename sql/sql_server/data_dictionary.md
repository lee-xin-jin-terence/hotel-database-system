| Table            | Column          | Data Type                     | Constraints / Description                                                               |
| ---------------- | --------------- | ----------------------------- | --------------------------------------------------------------------------------------- |
| **Hotel**        | hotelId         | INT IDENTITY(1,1) PRIMARY KEY | Unique identifier for each hotel (auto-increment).                                      |
|                  | name            | VARCHAR(100)                  | Hotel name (required).                                                                  |
|                  | address         | VARCHAR(255)                  | Hotel address (optional).                                                               |
|                  | phoneNumber     | VARCHAR(20)                   | Contact phone number for the hotel (optional).                                          |
|                  | emailAddress    | VARCHAR(100)                  | Contact email address for the hotel (optional).                                         |
| **Room**         | roomId          | INT IDENTITY(1,1) PRIMARY KEY | Unique identifier for each room (auto-increment).                                       |
|                  | hotelId         | INT                           | Foreign key referencing Hotel(hotelId), indicates the hotel owning the room (required). |
|                  | roomNumber      | VARCHAR(20)                   | Room number or identifier within the hotel (optional).                                  |
|                  | roomType        | VARCHAR(50)                   | Type/category of the room (e.g., Single, Double, Suite) (optional).                     |
|                  | capacity        | INT                           | Maximum occupancy, must be > 0.                                                         |
|                  | pricePerNight   | DECIMAL(10,2)                 | Price per night in currency units, must be >= 0.                                        |
| **Booking**      | bookingId       | INT IDENTITY(1,1) PRIMARY KEY | Unique identifier for each booking (auto-increment).                                    |
|                  | roomId          | INT                           | Foreign key referencing Room(roomId), indicates booked room (required).                 |
|                  | checkingInDate  | DATE                          | Date when guest checks in (optional).                                                   |
|                  | checkingOutDate | DATE                          | Date when guest checks out (optional).                                                  |
|                  | bookingDate     | DATE                          | Date when booking was made, defaults to current date.                                   |
|                  | status          | VARCHAR(50)                   | Booking status (e.g., Confirmed, Cancelled, Pending) (optional).                        |
| **Guest**        | guestId         | INT IDENTITY(1,1) PRIMARY KEY | Unique identifier for each guest (auto-increment).                                      |
|                  | firstName       | VARCHAR(50)                   | Guest's first name (optional).                                                          |
|                  | lastName        | VARCHAR(50)                   | Guest's last name (optional).                                                           |
|                  | phoneNumber     | VARCHAR(20)                   | Guest contact number (optional).                                                        |
|                  | emailAddress    | VARCHAR(100)                  | Guest email address (optional).                                                         |
|                  | address         | VARCHAR(255)                  | Guest's postal address (optional).                                                      |
| **BookingGuest** | bookingGuestId  | INT IDENTITY(1,1) PRIMARY KEY | Unique identifier for the booking-guest relationship (auto-increment).                  |
|                  | bookingId       | INT                           | Foreign key referencing Booking(bookingId) (required).                                  |
|                  | guestId         | INT                           | Foreign key referencing Guest(guestId) (required).                                      |
|                  | isPrimary       | BIT                           | Indicates if the guest is the primary guest for the booking (true/false).               |
| **Payment**      | paymentId       | INT IDENTITY(1,1) PRIMARY KEY | Unique identifier for each payment (auto-increment).                                    |
|                  | bookingId       | INT                           | Foreign key referencing Booking(bookingId) (required).                                  |
|                  | paymentDate     | DATE                          | Date the payment was made, defaults to current date.                                    |
|                  | amount          | DECIMAL(10,2)                 | Payment amount, must be >= 0.                                                           |
|                  | paymentMethod   | VARCHAR(50)                   | Method of payment (e.g., Credit Card, Cash) (optional).                                 |
|                  | status          | VARCHAR(50)                   | Payment status (e.g., Completed, Pending, Failed) (optional).                           |
