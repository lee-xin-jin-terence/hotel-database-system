-- HOTEL table
CREATE TABLE Hotel (
    hotelId SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phoneNumber VARCHAR(20),
    emailAddress VARCHAR(100)
);

-- ROOM table
CREATE TABLE Room (
    roomId SERIAL PRIMARY KEY,
    hotelId INT NOT NULL,
    roomNumber VARCHAR(20),
    roomType VARCHAR(50),
    capacity INT CHECK (capacity > 0),
    pricePerNight NUMERIC(10, 2) CHECK (pricePerNight >= 0),
    CONSTRAINT fk_room_hotel FOREIGN KEY (hotelId) REFERENCES Hotel(hotelId)
);

-- BOOKING table
CREATE TABLE Booking (
    bookingId SERIAL PRIMARY KEY,
    roomId INT NOT NULL,
    checkingInDate DATE,
    checkingOutDate DATE,
    bookingDate DATE DEFAULT CURRENT_DATE,
    status VARCHAR(50),
    CONSTRAINT fk_booking_room FOREIGN KEY (roomId) REFERENCES Room(roomId)
);

-- GUEST table
CREATE TABLE Guest (
    guestId SERIAL PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    phoneNumber VARCHAR(20),
    emailAddress VARCHAR(100),
    address VARCHAR(255)
);

-- BOOKINGGUEST (Join Table)
CREATE TABLE BookingGuest (
    bookingGuestId SERIAL PRIMARY KEY,
    bookingId INT NOT NULL,
    guestId INT NOT NULL,
    isPrimary BOOLEAN,  -- true or false
    CONSTRAINT fk_bookingguest_booking FOREIGN KEY (bookingId) REFERENCES Booking(bookingId),
    CONSTRAINT fk_bookingguest_guest FOREIGN KEY (guestId) REFERENCES Guest(guestId)
);

-- PAYMENT table
CREATE TABLE Payment (
    paymentId SERIAL PRIMARY KEY,
    bookingId INT NOT NULL,
    paymentDate DATE DEFAULT CURRENT_DATE,
    amount NUMERIC(10, 2) CHECK (amount >= 0),
    paymentMethod VARCHAR(50),
    status VARCHAR(50),
    CONSTRAINT fk_payment_booking FOREIGN KEY (bookingId) REFERENCES Booking(bookingId)
);
